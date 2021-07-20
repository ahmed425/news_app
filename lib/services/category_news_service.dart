import 'dart:convert';

import '../models/NewsTileModel.dart';
import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class CategoryNewsService {
  List<ArticleModel> _specificArticles = [];

  Future<List<ArticleModel>> getCategoryNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=65b4b1023b67477382f03e241289d4ec";
    // print('Alarm Fired at ${DateTime.now()}');

    var response = await http.get(url);

    var jsonData =await jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      // _specificArticles.clear();

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


// Future<List<NewsTileModel>> getCategoryNews(String category) async{
//   print("category in service"+category);
//
//
//   String url =
//       "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=65b4b1023b67477382f03e241289d4ec";
//
//   var response = await http.get(url);
//
//   var jsonData = jsonDecode(response.body);
//
//   if(jsonData['status'] == "ok"){
//     jsonData["articles"].forEach((element){
//
//       if(element['urlToImage'] != null && element['description'] != null){
//         NewsTileModel article = NewsTileModel(
//           title: element['title'],
//           desc: element['description'],
//           imageUrl: element['urlToImage'],
//           articleUrl: element["url"],
//         );
//         categoryNews.add(article);
//       }
//
//     });
//   }
//   return categoryNews;
//
// }

}
