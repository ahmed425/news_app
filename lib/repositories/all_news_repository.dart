import 'package:news_app/services/all_news_service.dart';

import '../models/NewsTileModel.dart';

class AllNewsRepository{

  AllNewsService _allNewsService = AllNewsService();

  Future<List<NewsTileModel>> fetchNews(){
    return _allNewsService.getAllNews();
  }
}