import 'package:news_app/services/category_service.dart';
import '../models/category_model.dart';

class CategoryRepository {
  CategoryService _categoryService = CategoryService();

  List<CategoryModel> fetchCategories() {
    return _categoryService.categories;
  }
}
