// import 'package:android_alarm_manager_plus/android_alarm_manager.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:news_app/data/models/news_tile_model.dart';
// import 'package:news_app/repositories/category_news_repository.dart';
// import 'dart:io' show Platform;
//
// class CategoryNewsProvider with ChangeNotifier {
//   List<NewsTileModel> categoryNews;
//
//   CategoryNewsRepository _categoryNewsRepository = CategoryNewsRepository();
//
//   CategoryNewsProvider(String category) {
//     print("category in provider constructor:  " + category);
//     getCategoryNews(category);
//     if (Platform.isAndroid) {
//       AndroidAlarmManager.periodic(Duration(seconds: 10), 1, getCategoryNews);
//     }
//   }
//
//   void getCategoryNews(String category) async {
//     print("category in getCategoryNews:  " + category);
//     await _categoryNewsRepository
//         .fetchCategoryNews(category)
//         .then((fetchedCategoryNews) {
//       categoryNews = fetchedCategoryNews;
//       print('Fetching or Updating Category News is done at ${DateTime.now()}');
//       print("Fetched Category News are : " + categoryNews.toString());
//       notifyListeners();
//     });
//   }
// }
