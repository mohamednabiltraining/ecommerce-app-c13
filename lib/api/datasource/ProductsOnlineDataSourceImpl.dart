import 'package:ecommerce_app/api/WebServices.dart';
import 'package:ecommerce_app/data/dataSource/ProductsOnlineDataSource.dart';
import 'package:ecommerce_app/domain/model/Product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsOnlineDataSource)
class ProductsOnlineDataSourceImpl implements ProductsOnlineDataSource {
  WebServices _webServices;

  ProductsOnlineDataSourceImpl(this._webServices);

  @override
  Future<List<Product>?> getProducts(
      {int limit = 10,
      int page = 1,
      String? sort,
      String? search,
      String? category,
      String? brand}) async {
    var response = await _webServices.getProducts(
      limit: limit,
      page: page,
      sort: sort,
      search: search,
      category: category,
    );
    return response.data
        ?.map(
          (dto) => dto.toProduct(),
        )
        .toList();
  }
}
