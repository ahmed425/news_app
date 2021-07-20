import 'package:android_alarm_manager_plus/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/category_widget.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';
import '../widgets/category_widget.dart';

NewsProvider newsProvider;

class HomePage extends StatelessWidget {
  int alarmId = 1;
  CategoryProvider categoryProvider;

  @override
  Widget build(BuildContext context) {
    // AndroidAlarmManager.periodic(
    //     Duration(seconds: 3), alarmId, updateNews);
    // newsProvider = Provider.of<NewsProvider>(context);
    // categoryProvider = Provider.of<CategoryProvider>(context);
// print()
    return Scaffold(
      appBar: myAppBar(),
      body:

          /// Categories
          Padding(
        padding: const EdgeInsets.only(left: 10),
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
                        final categoryName =
                            categoryProvider.categories[index].categoryName;
                        final categoryImage =
                            categoryProvider.categories[index].imageAssetUrl;

                        return CategoryWidget(categoryImage, categoryName);
                      })
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
      // Container(
      //   padding: EdgeInsets.symmetric(horizontal: 16),
      //   height: 70,
      //   child: ListView.builder(
      //       scrollDirection: Axis.horizontal,
      //       itemCount: categoryProvider.categories.length,
      //       itemBuilder: (context, index) {
      //         return CategoryWidget(
      //             categoryProvider.categories[index].imageAssetUrl,
      //             categoryProvider.categories[index].categoryName);
      //       }),
      // ),
    );
  }
}

void updateNews() {
  print('Updating news is called at ${DateTime.now()}');
  // newsProvider.fetchAndSetNews();
}
// Container(
// margin: EdgeInsets.only(top: 16),
// child:

// return ListView.builder(
// itemCount: snapshot.data.length,
// shrinkWrap: true,
// physics: ClampingScrollPhysics(),
// itemBuilder: (context, index) {
// return NewsTileWidget(
// snapshot.data[index].urlToImage,
// snapshot.data[index].title,
// snapshot.data[index].description,
// snapshot.data[index].articleUrl);
// });
// }
// }),

// FutureBuilder(
// future: newsProvider.fetchAndSetNews(),
// builder:
// (BuildContext context, AsyncSnapshot snapshot) {
// print(snapshot.data);
// if (snapshot.data == null) {
// return Center(
// child: Container(
// child: Center(
// child: CircularProgressIndicator())),
// );
// } else {
// // _loading=false;
