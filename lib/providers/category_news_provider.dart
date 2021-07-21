import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/repositories/category_news_repository.dart';

class CategoryNewsProvider with ChangeNotifier{
  List<NewsTileModel> categoryNews ;
  CategoryNewsRepository _categoryNewsRepository = CategoryNewsRepository();
CategoryNewsProvider(String category){
    print("category in provider constructor:  "+category);
    getCategoryNews(category);
  }
  void getCategoryNews(String category) async{
print("category in getCategoryNews:  "+category);
    await _categoryNewsRepository.fetchCategoryNews(category).then(
            (fetchedCategoryNews){
                categoryNews=fetchedCategoryNews;
                print("Fetched Category News are : "+categoryNews.toString());
          notifyListeners();
        }
    );
  }

}