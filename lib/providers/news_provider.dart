import 'dart:convert';
import 'package:android_alarm_manager_plus/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/repositories/news_repository.dart';

import '../models/NewsTileModel.dart';

class NewsProvider with ChangeNotifier {
  // NewsTileModel _newsTileModel=new NewsTileModel(imageUrl: null, title: null, desc: null, articleUrl: null);
  // bool _loading=true;
  List<NewsTileModel> allArticles ;
  List<ArticleModel> specificArticles ;

  // List<ArticleModel> newsList;
  NewsRepository _newsRepository = NewsRepository();


  void getNews() {
    _newsRepository.fetchNews().then(
            (news){
              allArticles  = news;
          notifyListeners();
        }
    );
  }

}
