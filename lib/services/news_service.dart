import 'dart:convert';

import '../models/NewsTileModel.dart';
import '../models/NewsTileModel.dart';
import '../models/NewsTileModel.dart';
import '../models/NewsTileModel.dart';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsService{
  Future<List<NewsTileModel>> fetchNews() async{
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=65b4b1023b67477382f03e241289d4ec";
    final response = await http.get(url);
    if(response.statusCode == 200){
      print(response.body);
      // return (json.decode(response.body) as List).map((e) => Post.fromJson(e)).toList();
      return List<NewsTileModel>.from((json.decode(response.body) as List).map((e) => NewsTileModel.fromJson((e)))).toList();
    }else{
      throw Exception('FAILED TO LOAD POST');
    }
  }
 void fetchAndSetNewsForSpecificCategory(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=65b4b1023b67477382f03e241289d4ec";
    // print('Alarm Fired at ${DateTime.now()}');

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

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
          // _specificArticles.add(article);
        }
      });
    }
    // print(_specificArticles.length.toString());
    // return _specificArticles;
  }
}

// Future<List<NewsTileModel>> fetchAndSetNews() async {
//   final response = await http.get('https://jsonplaceholder.typicode.com/posts');
//   if(response.statusCode == 200){
//     print(response.body);
//     // return (json.decode(response.body) as List).map((e) => Post.fromJson(e)).toList();
//     return List<Post>.from((json.decode(response.body) as List).map((e) => Post.fromJson((e)))).toList();
//   }else {
//     throw Exception('FAILED TO LOAD POST');
//   }

  // String url =
  //     "http://newsapi.org/v2/top-headlines?country=in&apiKey=65b4b1023b67477382f03e241289d4ec";
  //
  // var response = await http.get(url);
  //
  // var jsonData = jsonDecode(response.body);
  //
  // if (jsonData['status'] == "ok") {
  //   jsonData["articles"].forEach((element) {
  //     if (element['urlToImage'] != null && element['description'] != null) {
  //       ArticleModel article = ArticleModel(
  //         title: element['title'],
  //         author: element['author'],
  //         description: element['description'],
  //         urlToImage: element['urlToImage'],
  //         content: element["content"],
  //         articleUrl: element["url"],
  //       );
  //       // _allArticles.add(article);
  //     }
  //   });
  // }
  // // print(_allArticles.length.toString());
  //
  //
  // // return _allArticles;