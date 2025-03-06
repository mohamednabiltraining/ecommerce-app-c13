import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/categories/categories_list.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/sub_categories/sub_categories_list.dart';
import 'package:flutter/material.dart';

class CategoriesTabContent extends StatefulWidget {
  final List<Category> categories;
  const CategoriesTabContent({
    required this.categories,
    super.key,
  });

  @override
  State<CategoriesTabContent> createState() => _CategoriesTabContentState();
}

class _CategoriesTabContentState extends State<CategoriesTabContent> {
  late Category selectedCategory;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCategory = widget.categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12, vertical: AppPadding.p12),
      child: Row(
        children: [
          CategoriesList(
              categories: widget.categories, onCategoryClick: onCategoryClick),
          // const CategoriesList(),
          const SizedBox(
            width: AppSize.s16,
          ),
          SubCategoriesList(category: selectedCategory)
        ],
      ),
    );
  }

  void onCategoryClick(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
