import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:http/http.dart' as http;

class CategoryNewsService {
  List<NewsTileModel> _categoryNews = [];

  Future<List<NewsTileModel>> getCategoryNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=65b4b1023b67477382f03e241289d4ec";
    var response = await http.get(url);

    var jsonData = await jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsTileModel article = NewsTileModel(
            title: element['title'],
            imageUrl: element['urlToImage'],
            desc: element['description'],
            articleUrl: element["url"],
          );
          _categoryNews.add(article);
        }
      });
    }
    else {
      Fluttertoast.showToast(
        msg: 'You have made too many requests recently. Developer accounts are limited to 100 requests over a 24 hour period (50 requests available every 12 hours). Please upgrade to a paid plan if you need more requests',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return _categoryNews;
  }
}
