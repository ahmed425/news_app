import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';
import 'package:provider/provider.dart';

class NewsForSpecificCategory extends StatelessWidget {
  String newsCategory;

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<NewsProvider>(context);
    print("Tapped Category is " + newsCategory);
    // providerData.fetchAndSetNewsForSpecificCategory(newsCategory);
    return Scaffold(
        appBar: myAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: FutureBuilder(
                        // future:
                        // providerData
                        //     .fetchAndSetNewsForSpecificCategory(newsCategory),
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

  NewsForSpecificCategory(this.newsCategory);
}
