import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsForSpecificCategory {

  List<ArticleModel> news = [];

  Future<void> getNewsForCategory(String category) async {

    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=65b4b1023b67477382f03e241289d4ec";

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
            url: element["url"],
          );
          news.add(article);
        }
      });
    }
    // Future<void> getNewsForCategory(String category) async{
    //
    //   String url = "https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=65b4b1023b67477382f03e241289d4ec";
    //   // String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=65b4b1023b67477382f03e241289d4ec";
    //   var response = await http.get(url);
    //
    //   var jsonData = jsonDecode(response.body);
    //
    //   if(jsonData['status'] == "ok"){
    //     jsonData["articles"].forEach((element){
    //
    //       if(element['urlToImage'] != null && element['description'] != null){
    //         ArticleModel article = ArticleModel(
    //           title: element['title'],
    //           author: element['author'],
    //           description: element['description'],
    //           urlToImage: element['urlToImage'],
    //           content: element["content"],
    //           url: element["url"],
    //         );
    //         news.add(article);
    //       }
    //
    //     });
    //   }
    //
    //
    // }

  }
}
