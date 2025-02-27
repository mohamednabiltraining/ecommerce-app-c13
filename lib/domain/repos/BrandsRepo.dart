import 'package:ecommerce_app/domain/model/Brand.dart';

abstract class BrandsRepo {
  Future<List<Brand>?> getBrands();
}
