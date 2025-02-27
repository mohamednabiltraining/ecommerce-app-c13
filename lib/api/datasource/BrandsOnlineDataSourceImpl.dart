import 'package:ecommerce_app/api/WebServices.dart';
import 'package:ecommerce_app/data/dataSource/BrandsOnlineDataSource.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsOnlineDataSource)
class BrandsOnlineDataSourceImpl implements BrandsOnlineDataSource {
  WebServices _webServices;

  BrandsOnlineDataSourceImpl(this._webServices);

  @override
  Future<List<Brand>?> getBrands() async {
    var response = await _webServices.getBrands();
    return response.data?.map((brandDto) => brandDto.toBrand()).toList();
  }
}
