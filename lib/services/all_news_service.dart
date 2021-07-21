import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_tile_model.dart';

class AllNewsService {
  List<NewsTileModel> news = [];

  Future<List<NewsTileModel>> getAllNews() async {
    String url = "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=65b4b1023b67477382f03e241289d4ec";

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
    return news;
  }
}