import 'dart:convert';
import 'package:android_alarm_manager_plus/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsProvider with ChangeNotifier {
  // NewsTileModel _newsTileModel=new NewsTileModel(imageUrl: null, title: null, desc: null, articleUrl: null);
  // bool _loading=true;
  List<ArticleModel> _allArticles = [];
  List<ArticleModel> _specificArticles = [];

  // List<ArticleModel> get allArticles => _allArticles;

  // set allArticles(List<ArticleModel> value) {
  //   _allArticles = value;
  // }
  //
  // List<ArticleModel> get articles => _allArticles;
  //
  // set articles(List<ArticleModel> value) {
  //   _allArticles = value;
  // }

  List<ArticleModel> newsList;

  // CategoryModel _categoryModel=new CategoryModel(imageAssetUrl: "",categoryName: "");

  Future<List<ArticleModel>> fetchAndSetNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=65b4b1023b67477382f03e241289d4ec";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            articleUrl: element["url"],
          );
          _allArticles.add(article);
        }
      });
    }
    print(_allArticles.length.toString());


    return _allArticles;
  }

  Future<List<ArticleModel>> fetchAndSetNewsForSpecificCategory(
      String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=65b4b1023b67477382f03e241289d4ec";
    // print('Alarm Fired at ${DateTime.now()}');

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      _specificArticles.clear();

      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            articleUrl: element["url"],
          );
          _specificArticles.add(article);
        }
      });
    }
    // print(_specificArticles.length.toString());
    return _specificArticles;
  }
}
