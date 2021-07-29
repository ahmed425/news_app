import 'package:news_app/data/models/news_tile_model.dart';
import 'package:news_app/services/category_news_service.dart';

class CategoryNewsRepository {
  CategoryNewsService _categoryNewsService = CategoryNewsService();

  Future<List<NewsTileModel>> fetchCategoryNews(String category) async {
    print("category in fetch repo" + category);
    return await _categoryNewsService.getCategoryNews(category);
  }
}
