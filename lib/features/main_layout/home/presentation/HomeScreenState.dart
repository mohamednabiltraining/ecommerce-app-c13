import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/model/Product.dart';

abstract class HomeScreenState {}

class InitialState extends HomeScreenState {}

class LoadingState extends HomeScreenState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class SuccessState extends HomeScreenState {
  List<Category>? categories;
  List<Brand>? brands;
  List<Product>? products;

  SuccessState({this.categories, this.brands, this.products});

  SuccessState copyWith({
    List<Category>? categories,
    List<Brand>? brands,
    List<Product>? products,
  }) {
    return SuccessState(
      categories: categories ?? this.categories,
      brands: brands ?? this.brands,
      products: products ?? this.products,
    );
  }
}

class ErrorState extends HomeScreenState {
  Exception? exception;
  String? errorMessage;

  ErrorState({this.exception, this.errorMessage});
}

class NavigateState extends HomeScreenState {
  String route;

  NavigateState(this.route);
}
