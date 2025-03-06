part of 'sub_categories_cubit.dart';

sealed class SubCategoriesState {}

final class SubCategoriesInitial extends SubCategoriesState {}

final class SubCategoriesLoadingState extends SubCategoriesState {}

final class SubCategoriesSuccessState extends SubCategoriesState {
  final List<SubCategory> subCategories;

  SubCategoriesSuccessState({required this.subCategories});
}

final class SubCategoriesErrorState extends SubCategoriesState {
  final Exception exception;

  SubCategoriesErrorState(this.exception);
}
