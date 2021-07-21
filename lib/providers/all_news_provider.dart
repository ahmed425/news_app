import 'package:android_alarm_manager_plus/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/repositories/all_news_repository.dart';
import 'dart:io' show Platform;

class AllNewsProvider with ChangeNotifier {
  List<NewsTileModel> allNews;

  AllNewsRepository _allNewsRepository = AllNewsRepository();

  AllNewsProvider() {
    getNews();
    if (Platform.isAndroid) {
      AndroidAlarmManager.periodic(Duration(seconds: 10), 1, getNews);
    }
  }

  void getNews() {
    _allNewsRepository.fetchNews().then((news) {
      allNews = news;
      print('Fetching or Updating news is done at ${DateTime.now()}');
      notifyListeners();
    });
  }
}
