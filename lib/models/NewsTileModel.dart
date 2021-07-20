import 'package:flutter/cupertino.dart';

class NewsTileModel {
  String imageUrl, title, desc, articleUrl;

  NewsTileModel(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.articleUrl});
  factory NewsTileModel.fromJson(Map<String, dynamic> json){
    return NewsTileModel(
        imageUrl: json['urlToImage'],
        title: json['title'],
        desc: json['description'],
        articleUrl: json['articleUrl']
    );
  }

}
