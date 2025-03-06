import 'package:ecommerce_app/data/dataSource/CategoriesOnlineDataSource.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/model/sub_category.dart';
import 'package:ecommerce_app/domain/repos/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  // concrete class
  final CategoriesOnlineDataSource _categoriesOnlineDataSource;

  CategoriesRepoImpl(this._categoriesOnlineDataSource);

  @override
  Future<List<Category>?> getCategories() {
    return _categoriesOnlineDataSource.getCategories();
  }

  @override
  Future<List<SubCategory>?> getSubCategories(String id) {
    return _categoriesOnlineDataSource.getSubCategories(id);
  }
}
