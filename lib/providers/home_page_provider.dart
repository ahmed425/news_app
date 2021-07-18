import 'package:flutter/material.dart';
import 'package:news_app/helper/AllNews.dart';
import 'package:news_app/models/NewsTileModel.dart';
import 'package:news_app/models/article_model.dart';

class HomePageProvider with ChangeNotifier{
  NewsTileModel _newsTileModel=new NewsTileModel(imageUrl: null, title: null, desc: null, articleUrl: null);
  bool _loading=true;
  List<ArticleModel> newsList;

  void getNews() async {
    AllNews allNews = AllNews();
    await allNews.getNews();
    newsList = allNews.articles;
    // setState(() {
      _loading = false;
    // _newsTile.imageUrl=new

    // });
  }
  //Method to update news tile
  void updateNewsTile(){
_newsTileModel.imageUrl=newsList[0].urlToImage;

  }
}