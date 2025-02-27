import 'dart:async';

import 'package:ecommerce_app/core/widget/MainErrorWidget.dart';
import 'package:ecommerce_app/core/widget/MainLoadingWidget.dart';
import 'package:ecommerce_app/core/widget/product_card.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/HomeScreenState.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_view_model.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/HomeSection.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
    homeViewModel.loadHomePage();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // field injection
  var homeViewModel = getIt.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<HomeViewModel, HomeScreenState>(
        bloc: homeViewModel,
        listener: (context, event) {
          if (event is NavigateState) {
            Navigator.pushNamed(context, event.route);
          }
        },
        listenWhen: (previous, current) {
          if (current is LoadingState) {
            return true;
          }
          if (current is NavigateState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is SuccessState) {
            return BuildSuccessState(state);
          }
          if (state is LoadingState) {
            return MainLoadingWidget(state.loadingMessage);
          }
          if (state is ErrorState) {
            return MainErrorWidget(
              message: state.errorMessage,
              onTryAgain: () {
                homeViewModel.loadHomePage();
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget BuildSuccessState(SuccessState state) {
    return Column(
      children: [
        CustomAdsWidget(
          adsImages: adsImages,
          currentIndex: _currentIndex,
          timer: _timer,
        ),
        Column(
          children: [
            state.categories != null
                ? Homesection(
                    mainSectionBuilder: Builder(
                      builder: (context) {
                        return SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  homeViewModel.onCategoryClick(
                                      state.categories![index]);
                                },
                                child: HomeCategoryItemWidget(
                                    state.categories![index]),
                              );
                            },
                            itemCount: state.categories?.length ?? 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        );
                      },
                    ),
                    sectionTitle: "Categories",
                    onViewAllPressed: () {},
                  )
                : Container(),
            SizedBox(height: 12.h),
            state.brands != null
                ? Homesection(
                    mainSectionBuilder: Builder(
                      builder: (context) {
                        return SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomBrandWidget(state.brands![index]);
                            },
                            itemCount: state.brands?.length ?? 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        );
                      },
                    ),
                    sectionTitle: "Brands",
                    onViewAllPressed: () {},
                  )
                : Container(),
            SizedBox(height: 12.h),
            buildMostSellingSection(state),
          ],
        )
      ],
    );
  }

  Widget buildMostSellingSection(SuccessState state) {
    return Column(
      children: [
        CustomSectionBar(
          sectionNname: 'Most Selling Products',
          function: () {},
        ),
        SizedBox(
          child: SizedBox(
            height: 360.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCard(
                  state.products![index],
                );
              },
              itemCount: state.products?.length ?? 0,
            ),
          ),
        )
      ],
    );
  }
}