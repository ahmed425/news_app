import 'package:android_alarm_manager_plus/android_alarm_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/all_news_provider.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/widgets/category_widget.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';
import '../widgets/category_widget.dart';
import '../widgets/news_tile_widget.dart';

// AllNewsProvider newsProvider;

class HomePage extends StatelessWidget {
  final int alarmId = 1;
  // bool isOn = false;

  // CategoryProvider categoryProvider;

  @override
  Widget build(BuildContext context) {
    AndroidAlarmManager.periodic(
        Duration(seconds: 1), 1, updateNews);
    // newsProvider = Provider.of<AllNewsProvider>(context);
    // categoryProvider = Provider.of<CategoryProvider>(context);
// print()
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Categories
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                child: ChangeNotifierProvider<CategoryProvider>(
                  create: (context) => CategoryProvider(),
                  child: Consumer<CategoryProvider>(
                    builder: (buildContext, categoryProvider, _) {
                      print(categoryProvider.categories.toString());
                      return (categoryProvider.categories != null)
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categoryProvider.categories.length,
                              itemBuilder: (ctx, index) {
                                final category= categoryProvider
                                    .categories[index];
                                // final categoryImage = categoryProvider
                                    // .categories[index].imageAssetUrl;

                                return CategoryWidget(
                                   categoryModel: category);
                              })
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ),

            /// News
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * (5 / 6),
                child: ChangeNotifierProvider<AllNewsProvider>(
                  create: (context) => AllNewsProvider(),
                  child: Consumer<AllNewsProvider>(
                    builder: (buildContext, newsProvider, _) {
                      // print(newsProvider.allNews.toString());
                      return (newsProvider.allNews != null)
                          ? ListView.builder(
                              itemCount: newsProvider.allNews.length,
                              itemBuilder: (ctx, index) {
                                // print(newsProvider.allNews.toString());
                                return NewsTileWidget(
                                  newsProvider.allNews[index]
                                    );
                              })
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void updateNews() {
  print('Updating news is called at');
//
//   newsProvider.fetchAndSetNews();
}