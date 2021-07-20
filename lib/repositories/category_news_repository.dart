import 'package:news_app/services/category_news_service.dart';

import '../models/NewsTileModel.dart';
import '../models/article_model.dart';

class CategoryNewsRepository{
  CategoryNewsService _categoryNewsService = CategoryNewsService();

  Future<List<ArticleModel>> fetchCategoryNews(String category) async{
    print("category in fetch repo"+category);
    return  await _categoryNewsService.getCategoryNews(category);
  }
}