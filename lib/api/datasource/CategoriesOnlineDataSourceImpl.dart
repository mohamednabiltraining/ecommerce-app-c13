import 'package:ecommerce_app/api/WebServices.dart';
import 'package:ecommerce_app/data/dataSource/CategoriesOnlineDataSource.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource {
  WebServices _webServices;

  CategoriesOnlineDataSourceImpl(this._webServices);

  @override
  Future<List<Category>?> getCategories() async {
    var response = await _webServices.getCategories();
    return response.data?.map((cat_dto) => cat_dto.toCategory()).toList();
  }
}
