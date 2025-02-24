import 'package:ecommerce_app/domain/use_case/GetCategoriesUseCase.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel {
  GetCategoriesUseCase _getCategoriesUseCase;

  HomeViewModel(this._getCategoriesUseCase);

  Future<void> getCategories() async {
    var res = await _getCategoriesUseCase.invoke();
    print(res);
  }
}
