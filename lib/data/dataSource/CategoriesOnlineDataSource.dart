import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/model/sub_category.dart';

abstract class CategoriesOnlineDataSource {
  Future<List<Category>?> getCategories();
  Future<List<SubCategory>?> getSubCategories(String id);
}
