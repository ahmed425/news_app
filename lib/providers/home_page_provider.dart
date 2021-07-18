import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/helper/AllNews.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class HomePageProvider with ChangeNotifier{
  // NewsTileModel _newsTileModel=new NewsTileModel(imageUrl: null, title: null, desc: null, articleUrl: null);
  // bool _loading=true;
  List<ArticleModel> _articles  = [];

  List<ArticleModel> get articles => _articles;

  set articles(List<ArticleModel> value) {
    _articles = value;
  }

  List<ArticleModel> newsList;
  List<CategoryModel> _categories =
  [
    CategoryModel(categoryName: "Business",imageAssetUrl:"https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80" ),
    CategoryModel(categoryName:"Entertainment" ,imageAssetUrl: "https://images.unsplash.com/photo-1561174356-638d86f24f04?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=625&q=80"),
    CategoryModel(categoryName:"General" ,imageAssetUrl:"https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60" ),
    CategoryModel(categoryName:"Health" ,imageAssetUrl: "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80"),
    CategoryModel(categoryName: "Science",imageAssetUrl:"https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80" ),
    CategoryModel(categoryName:"Sports" ,imageAssetUrl:"https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80" ),


  ]
;

  List<CategoryModel> get categories => _categories;
  // CategoryModel _categoryModel=new CategoryModel(imageAssetUrl: "",categoryName: "");

   void getCategories() async{

//1
//
//      _categoryModel = new CategoryModel(categoryName :"Business"
//          ,imageAssetUrl:"https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80");
//      _categories.add(_categoryModel);
//     // print(_categories[0].categoryName);
//     // notifyListeners();
//
//     // _categoryModel=new CategoryModel();
//     //2
//     _categoryModel = new CategoryModel();
//     _categoryModel.categoryName = "Entertainment";
//     _categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1561174356-638d86f24f04?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=625&q=80";
//     _categories.add(_categoryModel);
//     // print(_categories[1].categoryName);
//     // notifyListeners();
//
//     //3
//     _categoryModel = new CategoryModel();
//     _categoryModel.categoryName = "General";
//     _categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
//     _categories.add(_categoryModel);
//     // notifyListeners();
//
//     //4
//     _categoryModel = new CategoryModel();
//     _categoryModel.categoryName = "Health";
//     _categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
//     _categories.add(_categoryModel);
//     // notifyListeners();
//
//     //5
//     _categoryModel = new CategoryModel();
//     // _categoryModel.categoryName = "Science";
//     // _categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
//     _categories.add(_categoryModel);
//     // notifyListeners();
//
//     //5
//     _categoryModel = new CategoryModel();
//     _categoryModel.categoryName = "Sports";
//     _categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
//     _categories.add(_categoryModel);
//     // notifyListeners();
//
//     //5
//     _categoryModel = new CategoryModel();
//     _categoryModel.categoryName = "Technology";
//     _categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
//     _categories.add(_categoryModel);



// print(_categoryModel);
//     notifyListeners();
     print(_categories[0].categoryName);
     print(_categories[1].categoryName);
     print(_categories[2].categoryName);
     print(_categories[3].categoryName);

  }

  Future<List<ArticleModel>> fetchAndSetNews() async{

    String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey=65b4b1023b67477382f03e241289d4ec";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            articleUrl: element["url"],
          );
          _articles.add(article);
// print(articles.length.toString());

        }

      });
    }
print(_articles.length.toString());
return _articles;
  }
  void setNews() async {
    AllNews allNews = AllNews();
    await fetchAndSetNews();
    newsList = allNews.articles;
    // setState(() {
    //   _loading = false;
    // _newsTile.imageUrl=new

    // });
  }
  //Method to update news tile
  // void updateNewsTile(){
// _newsTileModel.imageUrl=newsList[0].urlToImage;
//
//   }

  // CategoryModel get categoryModel => _categoryModel;
}