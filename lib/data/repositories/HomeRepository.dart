import 'dart:convert';
import 'dart:core';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/data/models/news_tile_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRepository {
  /// Throws [NetworkException].
  Future<List<NewsTileModel>> fetchNews();

 List<CategoryModel> fetchCategories();
}

class HomeRepositoryImplementation implements HomeRepository {
  List<NewsTileModel> news = [];
  List<CategoryModel> categories=[];
  @override
   List<CategoryModel> fetchCategories() {
   categories = [
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
return categories;
  }

  @override
  Future<List<NewsTileModel>> fetchNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=376e4657a0ef49d981f1cafe89f6d3ca";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsTileModel article = NewsTileModel(
            title: element['title'],
            desc: element['description'],
            imageUrl: element['urlToImage'],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    } else {
      Fluttertoast.showToast(
        msg:
            'You have made too many requests recently. Developer accounts are limited to 100 requests over a 24 hour period (50 requests available every 12 hours). Please upgrade to a paid plan if you need more requests',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return news;
  }
}

class NetworkException implements Exception {}
