import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_tile_model.dart';

class AllNewsService {
  List<NewsTileModel> news = [];

  Future<List<NewsTileModel>> getAllNews() async {
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
    }
    else {
      Fluttertoast.showToast(
        msg: 'You have made too many requests recently. Developer accounts are limited to 100 requests over a 24 hour period (50 requests available every 12 hours). Please upgrade to a paid plan if you need more requests',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return news;
  }
}
