import 'package:flutter/material.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/category_widget.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);

    // providerData.getCategories();
    newsProvider.fetchAndSetNews();
    return Scaffold(
        appBar: myAppBar(),
        body: SafeArea(
          child:
              SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  /// Categories
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 70,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryProvider.categories.length,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                              categoryProvider.categories[index].imageAssetUrl,
                              categoryProvider.categories[index].categoryName);
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: FutureBuilder(
                        future: newsProvider.fetchAndSetNews(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          print(snapshot.data);
                          if (snapshot.data == null) {
                            return Center(
                              child: Container(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            );
                          } else {
                            // _loading=false;
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return NewsTileWidget(
                                      snapshot.data[index].urlToImage,
                                      snapshot.data[index].title,
                                      snapshot.data[index].description,
                                      snapshot.data[index].articleUrl);
                                });
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
