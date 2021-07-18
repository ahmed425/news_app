import 'package:flutter/material.dart';
import 'package:news_app/helper/NewsForSpecificCategory.dart';
import 'package:news_app/helper/widgets.dart';
import 'package:news_app/providers/home_page_provider.dart';
import 'package:news_app/views/home.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';
import 'package:provider/provider.dart';

class NewsOfSpecificCategory extends StatelessWidget {
 String newsCategory;
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
    // providerData.getCategories();
    // providerData.fetchAndSetNews();
    print("Tapped Category is "+newsCategory);
    providerData.fetchAndSetNewsForSpecificCategory(newsCategory);
    // print(providerData.articles.length.toString() + "in build");
    // providerData.getNews().then((value) =>imageUrl=value);
    return Scaffold(
        appBar: MyAppBar(),
        body: SafeArea(
          child:
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: FutureBuilder(
                        future: providerData.fetchAndSetNewsForSpecificCategory(newsCategory),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          print(snapshot.data);
                          if (snapshot.data == null) {
                            return Center(
                              child: Container(
                                  child: Center(child: CircularProgressIndicator())),
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

// ignore: non_constant_identifier_names

    /// News Article
  }

  NewsOfSpecificCategory(this.newsCategory);
}
// class CategoryNews extends StatefulWidget {
//
//   final String newsCategory;
//
//   CategoryNews({this.newsCategory});
//
//   @override
//   _CategoryNewsState createState() => _CategoryNewsState();
// }
//
// class _CategoryNewsState extends State<CategoryNews> {
//   var newslist;
//   bool _loading = true;
//
//   @override
//   void initState() {
//     getNews();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   void getNews() async {
//     NewsForSpecificCategory news = NewsForSpecificCategory();
//     await news.getNewsForCategory(widget.newsCategory);
//     newslist = news.news;
//     setState(() {
//       _loading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "Flutter",
//               style:
//               TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
//             ),
//             Text(
//               "News",
//               style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
//             )
//           ],
//         ),
//         actions: <Widget>[
//           Opacity(
//             opacity: 0,
//             child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Icon(Icons.share,)),
//           )
//         ],
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//       ),
//       body: _loading ? Center(
//         child: CircularProgressIndicator(),
//       ) : SingleChildScrollView(
//         child: Container(
//           child: Container(
//             margin: EdgeInsets.only(top: 16),
//             child:
//     // SizedBox()
//             ListView.builder(
//                 itemCount: newslist.length,
//                 shrinkWrap: true,
//                 physics: ClampingScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return
//                     NewsTileWidget
//                 }
//                 ),
//           ),
//           )
//         ),
//       ),
//     );
//   }
// }

