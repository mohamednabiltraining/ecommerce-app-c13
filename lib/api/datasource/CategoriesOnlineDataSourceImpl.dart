import 'package:ecommerce_app/api/WebServices.dart';
import 'package:ecommerce_app/data/dataSource/CategoriesOnlineDataSource.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/model/sub_category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource {
  final WebServices _webServices;

  CategoriesOnlineDataSourceImpl(this._webServices);

  @override
  Future<List<Category>?> getCategories() async {
    var response = await _webServices.getCategories();
    return response.data?.map((catDto) => catDto.toCategory()).toList();
  }

  @override
  Future<List<SubCategory>?> getSubCategories(String id) async {
    var response = await _webServices.getSubCategories(id);
    return response.data
        ?.map((subCategoryResponse) => subCategoryResponse.toSubCategory())
        .toList();
  }
}
