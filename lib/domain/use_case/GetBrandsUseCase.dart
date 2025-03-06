import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/repos/BrandsRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  final BrandsRepo _brandsRepo;

  GetBrandsUseCase(this._brandsRepo);

  Future<List<Brand>?> invoke() {
    return _brandsRepo.getBrands();
  }
}
