import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/services/all_news_service.dart';

class AllNewsRepository {
  AllNewsService _allNewsService = AllNewsService();

  Future<List<NewsTileModel>> fetchNews() {
    return _allNewsService.getAllNews();
  }
}
