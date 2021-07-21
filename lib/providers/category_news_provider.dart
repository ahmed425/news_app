import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/repositories/category_news_repository.dart';
// import 'package:news_app/repositories/category_repository.dart';


class CategoryNewsProvider with ChangeNotifier{
// String categoryName;


  List<NewsTileModel> categoryNews ;

  CategoryNewsRepository _categoryNewsRepository = CategoryNewsRepository();
CategoryNewsProvider(String category){
    print("category in provider constructor:  "+category);
    getCategoryNews(category);
  }
  void getCategoryNews(String category) async{
// category=this.categoryName;
print("category in getCategoryNews:  "+category);

    await _categoryNewsRepository.fetchCategoryNews(category).then(
            (fetchedCategoryNews){
                categoryNews=fetchedCategoryNews;
                print("fetchedCategoryNews in Provider Constructor Method are: "+fetchedCategoryNews.toString());

                print("categoryNews in Provider Constructor Method are: "+categoryNews.toString());
          notifyListeners();
        }
    );
  }

}