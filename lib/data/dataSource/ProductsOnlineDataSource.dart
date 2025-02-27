import 'package:ecommerce_app/domain/model/Product.dart';

abstract class ProductsOnlineDataSource {
  Future<List<Product>?> getProducts({
    int limit = 10,
    int page = 1,
    String? sort,
    String? search,
    String? category,
    String? brand,
  });
}
