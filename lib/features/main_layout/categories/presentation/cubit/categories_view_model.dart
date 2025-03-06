import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/use_case/GetCategoriesUseCase.dart';
import 'package:ecommerce_app/domain/use_case/get_sub_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetSubCategoriesUseCase getSubCategoriesUseCase;
  CategoriesCubit(this.getCategoriesUseCase, this.getSubCategoriesUseCase)
      : super(_CategoriesInitial());

  Future<void> loadCategories() async {
    emit(CategoriesLoadingState());
    try {
      var categories = await getCategoriesUseCase();
      emit(CategoriesSuccessState(categories: categories!));
    } on Exception catch (ex) {
      emit(CategoriesErrorState(ex));
    }
  }
}
