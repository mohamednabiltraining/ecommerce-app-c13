import 'package:ecommerce_app/domain/model/Product.dart';
import 'package:ecommerce_app/domain/repos/ProductsRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  final ProductsRepo _productsRepo;

  GetProductsUseCase(this._productsRepo);

  Future<List<Product>?> getProducts({
    int limit = 10,
    int page = 1,
    String? sort,
    String? search,
    String? category,
    String? brand,
  }) {
    return _productsRepo.getProducts(
      limit: limit,
      page: page,
      sort: sort,
      search: search,
      category: category,
      brand: brand,
    );
  }
}
