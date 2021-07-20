import 'package:news_app/services/news_service.dart';

import '../models/NewsTileModel.dart';

class NewsRepository{

  NewsService _newsService = NewsService();

  Future<List<NewsTileModel>> fetchNews(){
    return _newsService.getAllNews();
  }
}