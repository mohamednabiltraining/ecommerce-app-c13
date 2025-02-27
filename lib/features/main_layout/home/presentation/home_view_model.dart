import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/use_case/GetBrandsUseCase.dart';
import 'package:ecommerce_app/domain/use_case/GetCategoriesUseCase.dart';
import 'package:ecommerce_app/domain/use_case/getProductsUseCase.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/HomeScreenState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeScreenState> {
  GetCategoriesUseCase _getCategoriesUseCase;
  GetBrandsUseCase _getBrandsUseCase;
  GetProductsUseCase _getProductsUseCase;

  HomeViewModel(this._getCategoriesUseCase, this._getBrandsUseCase,
      this._getProductsUseCase)
      : super(InitialState());

  Future<void> loadHomePage() async {
    emit(LoadingState());
    _loadBrands();
    _loadCategories();
    _loadProducts();
  }

  SuccessState _successState = SuccessState();

  Future<void> _loadCategories() async {
    try {
      var categories = await _getCategoriesUseCase.invoke();
      emit(_successState = _successState.copyWith(categories: categories));
    } on Exception catch (ex) {
      emit(ErrorState(exception: ex));
    }
  }

  Future<void> _loadBrands() async {
    try {
      var brands = await _getBrandsUseCase.invoke();
      emit(_successState = _successState.copyWith(brands: brands));
    } on Exception catch (ex) {
      emit(ErrorState(exception: ex));
    }
  }

  void onCategoryClick(Category category) {
    emit(NavigateState(Routes.cartRoute));
  }

  void _loadProducts() async {
    try {
      var products = await _getProductsUseCase.getProducts();
      emit(_successState = _successState.copyWith(products: products));
    } on Exception catch (ex) {
      emit(ErrorState(exception: ex));
    }
  }
}
