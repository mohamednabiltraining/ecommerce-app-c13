import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/MainLoadingWidget.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/categories/category_card_item.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/sub_categories/cubit/sub_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatefulWidget {
  final Category? category;
  const SubCategoriesList({super.key, this.category});

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  SubCategoriesCubit subCategoriesCubit = getIt.get<SubCategoriesCubit>();

  @override
  void didUpdateWidget(SubCategoriesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      subCategoriesCubit.loadSubCategories(widget.category!.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocProvider<SubCategoriesCubit>(
        create: (context) =>
            subCategoriesCubit..loadSubCategories(widget.category!.id!),
        child: CustomScrollView(
          slivers: <Widget>[
            // category title
            SliverToBoxAdapter(
              child: Text(
                'Laptops & Electronics',
                style: getBoldStyle(
                    color: ColorManager.primary, fontSize: FontSize.s14),
              ),
            ),
            // the category card
            SliverToBoxAdapter(
              child: CategoryCardItem(
                  "Laptops & Electronics",
                  ImageAssets.categoryCardImage,
                  goToCategoryProductsListScreen),
            ),
            // the grid view of the subcategories
            BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
                builder: (context, state) {
              if (state is SubCategoriesLoadingState) {
                return const SliverToBoxAdapter(
                  child: MainLoadingWidget(),
                );
              } else if (state is SubCategoriesSuccessState) {
                var subCategories = state.subCategories;
                return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: subCategories.length,
                      (context, index) => SubCategoryItem(
                          subCategories[index].name ?? '',
                          ImageAssets.subcategoryCardImage,
                          goToCategoryProductsListScreen),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: .68,
                      mainAxisSpacing: AppSize.s8,
                      crossAxisSpacing: AppSize.s8,
                    ));
              }
              return const SliverToBoxAdapter(
                child:
                    MainLoadingWidget(message: 'Error loading subcategories'),
              );
            }),

            // SliverGrid(
            //     delegate: SliverChildBuilderDelegate(
            //       childCount: subCategories!.length,
            //       (context, index) => SubCategoryItem(
            //           subCategories![index].name ?? '',
            //           ImageAssets.subcategoryCardImage,
            //           goToCategoryProductsListScreen),
            //     ),
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3,
            //       childAspectRatio: 0.75,
            //       mainAxisSpacing: AppSize.s8,
            //       crossAxisSpacing: AppSize.s8,
            //     ))
          ],
        ),
      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
