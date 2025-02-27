import 'package:ecommerce_app/data/dataSource/ProductsOnlineDataSource.dart';
import 'package:ecommerce_app/domain/model/Product.dart';
import 'package:ecommerce_app/domain/repos/ProductsRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  ProductsOnlineDataSource _productsOnlineDataSource;

  ProductsRepoImpl(this._productsOnlineDataSource);

  @override
  Future<List<Product>?> getProducts({
    int limit = 10,
    int page = 1,
    String? sort,
    String? search,
    String? category,
    String? brand,
  }) {
    return _productsOnlineDataSource.getProducts();
  }
}
