import 'package:ecommerce_app/data/dataSource/BrandsOnlineDataSource.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/repos/BrandsRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepo)
class BrandsRepoImpl implements BrandsRepo {
  BrandsOnlineDataSource _brandsOnlineDataSource;

  BrandsRepoImpl(this._brandsOnlineDataSource);

  @override
  Future<List<Brand>?> getBrands() {
    return _brandsOnlineDataSource.getBrands();
  }
}
