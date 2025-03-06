import 'package:ecommerce_app/core/widget/MainLoadingWidget.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/categories_tab_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/categories_view_model.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (context) => getIt.get<CategoriesCubit>()..loadCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return const MainLoadingWidget();
        } else if (state is CategoriesSuccessState) {
          return CategoriesTabContent(
            categories: state.categories,
          );
        } else {
          return const MainLoadingWidget(message: 'Error loading categories');
        }
      }),
    );
  }
}
