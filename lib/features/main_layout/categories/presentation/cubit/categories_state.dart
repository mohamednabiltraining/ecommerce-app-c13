part of 'categories_view_model.dart';

sealed class CategoriesState {}

final class _CategoriesInitial extends CategoriesState {}

final class CategoriesLoadingState extends CategoriesState {}

final class CategoriesSuccessState extends CategoriesState {
  final List<Category> categories;

  CategoriesSuccessState({required this.categories});
}

final class CategoriesErrorState extends CategoriesState {
  final Exception exception;

  CategoriesErrorState(this.exception);
}
