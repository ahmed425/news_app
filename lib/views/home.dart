import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/providers/home_page_provider.dart';
import 'package:news_app/widgets/CategoryCardWidget.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';
import 'package:provider/provider.dart';

import 'display_news_for_specificcategory.dart';

class HomePage extends StatelessWidget {
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
    return Scaffold(
        appBar: MyAppBar(),
        body: SafeArea(
            child:

                // _loading
                //     ?

                // Center(
                //   child: CircularProgressIndicator(),
                // )

                SingleChildScrollView(
                    child: Container(
                        child: Column(children: <Widget>[
          /// Categories
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 70,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: providerData.categories.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(providerData.categories[index].imageAssetUrl,providerData.categories[index].categoryName);

                }),
          ),
        ])))));
  }
}

// ignore: non_constant_identifier_names

/// News Article
//                 Container(
//                   margin: EdgeInsets.only(top: 16),
//                   child: ListView.builder(
//                       itemCount: 2,
//                       shrinkWrap: true,
//                       physics: ClampingScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         return NewsTileWidget(
//                           // imageUrl: newslist[index].urlToImage ?? "",
//                           // title: newslist[index].title ?? "",
//                           // desc: newslist[index].description ?? "",
//                           // articleUrl: newslist[index].articleUrl ?? "",
//                         );
//                       }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
