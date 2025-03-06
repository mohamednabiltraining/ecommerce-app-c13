import 'package:ecommerce_app/domain/model/sub_category.dart';
import 'package:ecommerce_app/domain/use_case/get_sub_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'sub_categories_state.dart';

@injectable
class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  final GetSubCategoriesUseCase getSubCategoriesUseCase;
  SubCategoriesCubit(this.getSubCategoriesUseCase)
      : super(SubCategoriesInitial());

  Future<void> loadSubCategories(String id) async {
    emit(SubCategoriesLoadingState());
    try {
      var subCategories = await getSubCategoriesUseCase(id);
      emit(SubCategoriesSuccessState(subCategories: subCategories!));
    } on Exception catch (ex) {
      emit(SubCategoriesErrorState(ex));
    }
  }
}
