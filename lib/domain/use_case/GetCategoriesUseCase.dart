import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/repos/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  CategoriesRepo _categoriesRepo;

  // DIP -- DI
  // DI --> constructor injection
  // function injection -> setter
  GetCategoriesUseCase(this._categoriesRepo);

  Future<List<Category>?> call() {
    // useCase-> Repository
    return _categoriesRepo.getCategories();
  }
}
