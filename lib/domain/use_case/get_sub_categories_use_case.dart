import 'package:ecommerce_app/domain/model/sub_category.dart';
import 'package:ecommerce_app/domain/repos/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoriesUseCase {
  final CategoriesRepo _categoryRepository;

  GetSubCategoriesUseCase(this._categoryRepository);

  Future<List<SubCategory>?> call(String categoryId) {
    return _categoryRepository.getSubCategories(categoryId);
  }
}
