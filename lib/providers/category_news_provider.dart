import 'package:flutter/cupertino.dart';
import 'package:news_app/repositories/category_news_repository.dart';
// import 'package:news_app/repositories/category_repository.dart';

import '../models/NewsTileModel.dart';
import '../models/article_model.dart';

class CategoryNewsProvider with ChangeNotifier{

  List<ArticleModel> categoryNews ;
// String category;

  // CategoryNewsProvider(this.category);

  CategoryNewsRepository _categoryNewsRepository = CategoryNewsRepository();
  CategoryNewsProvider(String category){
    print("category in provider constructor:  "+category);
    getCategoryNews(category);
  }

   getCategoryNews(String category) async{
    print("category in getCategoryNews:  "+category);

    await _categoryNewsRepository.fetchCategoryNews(category).then(
            (categoryNews){
          categoryNews  = categoryNews;
          print("news fetched: "+categoryNews.toString());
          notifyListeners();
        }
    );
  }

}