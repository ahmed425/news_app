import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class HomePageProvider with ChangeNotifier {
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
  List<CategoryModel> _categories = [
    CategoryModel(
        categoryName: "Business",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80"),
    CategoryModel(
        categoryName: "Entertainment",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1561174356-638d86f24f04?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=625&q=80"),
    CategoryModel(
        categoryName: "General",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
    CategoryModel(
        categoryName: "Health",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80"),
    CategoryModel(
        categoryName: "Science",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80"),
    CategoryModel(
        categoryName: "Sports",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
  ];

  List<CategoryModel> get categories => _categories;

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
    print(_specificArticles.length.toString());
    return _specificArticles;
  }
}
