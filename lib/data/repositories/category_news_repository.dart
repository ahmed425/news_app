import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/data/models/news_tile_model.dart';
import 'package:http/http.dart' as http;

abstract class CategoryNewsRepository {
  /// Throws [NetworkException].
  Future<List<NewsTileModel>> getCategoryNews(String category);
}

class CategoryNewsRepositoryImplementation implements CategoryNewsRepository {
  List<NewsTileModel> categoryNews = [];

  // String category;
  @override
  Future<List<NewsTileModel>> getCategoryNews(String category) async {
    print("cat in get : "+category);
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=376e4657a0ef49d981f1cafe89f6d3ca";
    var response = await http.get(url);

    var jsonData = await jsonDecode(response.body);
    if (categoryNews != []) {
      categoryNews.clear();
    }

    if (jsonData['status'] == "ok") {

      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsTileModel article = NewsTileModel(
            title: element['title'],
            imageUrl: element['urlToImage'],
            desc: element['description'],
            articleUrl: element["url"],
          );


            categoryNews.add(article);

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
    print("length : "+categoryNews.length.toString());
    return categoryNews;
  }
}

class NetworkException implements Exception {}
