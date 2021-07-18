import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/providers/home_page_provider.dart';
import 'package:news_app/widgets/CategoryCardWidget.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
 bool _loading=true;
  // var imageUrl;

//
//   List<CategoryModel> categories = List<CategoryModel>();
//
//   // void getNews() async {
//   //   AllNews news = AllNews();
//   //   await news.getNews();
//   //   newslist = news.news;
//   //   // setState(() {
//   //   //   _loading = false;
//   //   // });
//   // }
//
//   // @override
//   // void initState() {
//   //   _loading = true;
//   //   TODO: implement initState
//     // super.initState();
//
//     // categories = getCategories();
//     // getNews();
//   // }
//
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<HomePageProvider>(context);
    providerData.getCategories();
    providerData.fetchAndSetNews();
    print(providerData.articles.length.toString() + "in build");
    // providerData.getNews().then((value) =>imageUrl=value);
    return Scaffold(
        appBar: MyAppBar(),
        body: SafeArea(
          child:

//               _loading
//                   ?
//               //
//               Center(
//                 child: CircularProgressIndicator(),
//               )
// :
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
                        itemCount: providerData.categories.length,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                              providerData.categories[index].imageAssetUrl,
                              providerData.categories[index].categoryName);
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: FutureBuilder(
                        future: providerData.fetchAndSetNews(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          print(snapshot.data);
                          if (snapshot.data == null) {
                            return Center(
                              child: Container(
                                  child: Center(child: CircularProgressIndicator())),
                            );
                          } else {
                            _loading=false;
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

// ignore: non_constant_identifier_names

    /// News Article
  }
}
