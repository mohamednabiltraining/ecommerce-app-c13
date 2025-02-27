// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../api/WebServices.dart' as _i369;
import '../api/datasource/BrandsOnlineDataSourceImpl.dart' as _i840;
import '../api/datasource/CategoriesOnlineDataSourceImpl.dart' as _i428;
import '../api/datasource/ProductsOnlineDataSourceImpl.dart' as _i220;
import '../api/di.dart' as _i691;
import '../data/dataSource/BrandsOnlineDataSource.dart' as _i922;
import '../data/dataSource/CategoriesOnlineDataSource.dart' as _i189;
import '../data/dataSource/ProductsOnlineDataSource.dart' as _i721;
import '../data/repos/BrandsRepoImpl.dart' as _i600;
import '../data/repos/CategoriesRepoImpl.dart' as _i46;
import '../data/repos/ProductsRepoImpl.dart' as _i157;
import '../domain/repos/BrandsRepo.dart' as _i677;
import '../domain/repos/CategoriesRepo.dart' as _i181;
import '../domain/repos/ProductsRepo.dart' as _i79;
import '../domain/use_case/GetBrandsUseCase.dart' as _i886;
import '../domain/use_case/GetCategoriesUseCase.dart' as _i639;
import '../domain/use_case/getProductsUseCase.dart' as _i594;
import '../features/main_layout/home/presentation/home_view_model.dart' as _i19;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final netWorkModule = _$NetWorkModule();
    gh.singleton<_i361.BaseOptions>(() => netWorkModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
        () => netWorkModule.providePrettyDioLogger());
    gh.singleton<_i361.Dio>(() => netWorkModule.provideDio(
          gh<_i361.BaseOptions>(),
          gh<_i528.PrettyDioLogger>(),
        ));
    gh.singleton<_i369.WebServices>(
        () => netWorkModule.provideWebServices(gh<_i361.Dio>()));
    gh.factory<_i922.BrandsOnlineDataSource>(
        () => _i840.BrandsOnlineDataSourceImpl(gh<_i369.WebServices>()));
    gh.factory<_i677.BrandsRepo>(
        () => _i600.BrandsRepoImpl(gh<_i922.BrandsOnlineDataSource>()));
    gh.factory<_i189.CategoriesOnlineDataSource>(
        () => _i428.CategoriesOnlineDataSourceImpl(gh<_i369.WebServices>()));
    gh.factory<_i721.ProductsOnlineDataSource>(
        () => _i220.ProductsOnlineDataSourceImpl(gh<_i369.WebServices>()));
    gh.factory<_i886.GetBrandsUseCase>(
        () => _i886.GetBrandsUseCase(gh<_i677.BrandsRepo>()));
    gh.factory<_i181.CategoriesRepo>(
        () => _i46.CategoriesRepoImpl(gh<_i189.CategoriesOnlineDataSource>()));
    gh.factory<_i639.GetCategoriesUseCase>(
        () => _i639.GetCategoriesUseCase(gh<_i181.CategoriesRepo>()));
    gh.factory<_i79.ProductsRepo>(
        () => _i157.ProductsRepoImpl(gh<_i721.ProductsOnlineDataSource>()));
    gh.factory<_i594.GetProductsUseCase>(
        () => _i594.GetProductsUseCase(gh<_i79.ProductsRepo>()));
    gh.factory<_i19.HomeViewModel>(() => _i19.HomeViewModel(
          gh<_i639.GetCategoriesUseCase>(),
          gh<_i886.GetBrandsUseCase>(),
          gh<_i594.GetProductsUseCase>(),
        ));
    return this;
  }
}

class _$NetWorkModule extends _i691.NetWorkModule {}
