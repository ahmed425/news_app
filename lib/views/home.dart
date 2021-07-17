import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/AllNews.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/category_model.dart';

import 'article_details.dart';
import 'display_news_for_specificcategory.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _loading;
  var newslist;

  List<CategoryModel> categories = List<CategoryModel>();

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: _loading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                /// Categories
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          imageAssetUrl: categories[index].categoryImageUrl,
                          categoryName: categories[index].categoryName,
                        );
                      }),
                ),

                /// News Article
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: newslist.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewsTile(
                          imgUrl: newslist[index].urlToImage ?? "",
                          title: newslist[index].title ?? "",
                          desc: newslist[index].description ?? "",
                          content: newslist[index].content ?? "",
                          posturl: newslist[index].articleUrl ?? "",
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// ignore: non_constant_identifier_names
Widget MyAppBar(){
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Flutter ",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        ),
        Text(
          "News App",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile({this.imgUrl, this.desc, this.title, this.content, @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleDetails(
              articleUrl: posturl,
            )
        ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(

                        imgUrl,
                        errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                          return Icon(Icons.do_not_disturb);
                        },
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
              newsCategory: categoryName.toLowerCase(),
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app/helper/AllNews.dart';
// import 'package:news_app/helper/data.dart';
// import 'package:news_app/models/article_model.dart';
// import 'package:news_app/models/category_model.dart';
// import 'package:news_app/views/article_details.dart';
// import 'package:news_app/views/display_news_for_specificcategory.dart';
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   // var news_appList;
//   bool _loading = true;
//
//   List<CategoryModel> categories = new List<CategoryModel>();
//   List<ArticleModel> articles = new List<ArticleModel>();
//
//   void getNews() async {
//     News news = News();
//     await news.getNews();
//     articles = news.news;
//     setState(() {
//       _loading = false;
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     categories = getCategories();
//     getNews();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _loading
//             ? Center(
//                 child: Container(
//                 child: CircularProgressIndicator(),
//               ))
//             : SingleChildScrollView(
//                 child: Container(
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         height: 70,
//                         child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: categories.length,
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               return CategoryItem(
//                                 categoryImageUrl:
//                                     categories[index].categoryImageUrl,
//                                 categoryName: categories[index].categoryName,
//                               );
//                             }),
//                       ),
//                       Container(
//                         child: ListView.builder(
//                           shrinkWrap: true,
// // scrollDirection: Axis.versioningrtical,
//                           physics: ClampingScrollPhysics(),
//                           padding:
//                               EdgeInsets.only(top: 16, left: 16, right: 16),
//                           itemBuilder: (context, index) {
//                             return NewsItem(
//                               imageUrl: articles[index].urlToImage,
//                               title: articles[index].title,
//                               desc: articles[index].description,
//                               articleUrl: articles[index].url,
//                             );
//                           },
//                           itemCount: articles.length,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//         appBar: AppBar(
//             elevation: 0.0,
//             title: Text(
//               "Flutter News App",
//               style: TextStyle(color: Colors.blue),
//             ),
//             centerTitle: true));
//   }
// }
//
// class CategoryItem extends StatelessWidget {
//   final categoryName, categoryImageUrl;
//
//   CategoryItem({this.categoryName, this.categoryImageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(
//             builder: (context) => CategoryNews(
//               newsCategory: categoryName.toLowerCase(),
//             )
//         ));
//       },
//       // onTap: () {
//       //   Navigator.push(
//       //       context,
//       //       MaterialPageRoute(
//       //           builder: (context) => NewsForSpecificCategoryPage(
//       //               newsCategory: categoryName.toString().toLowerCase())));
//
//
//       child: Container(
//         margin: EdgeInsets.only(right: 16),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(6),
//               child: CachedNetworkImage(
//                 imageUrl: categoryImageUrl,
//                 width: 120,
//                 height: 60,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               width: 120,
//               height: 60,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6),
//                 color: Colors.black26,
//               ),
//               child: Text(
//                 categoryName,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class NewsItem extends StatelessWidget {
//   final String imageUrl, title, desc, articleUrl;
//
//   NewsItem(
//       {@required this.imageUrl,
//       @required this.title,
//       @required this.desc,
//       @required this.articleUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ArticleDetails(
//                       articleUrl: articleUrl,
//                     )));
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 16),
//         child: Column(
//           children: [
//             ClipRRect(
//               child: Image.network(imageUrl),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.black87,
//                   fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               desc,
//               style: TextStyle(color: Colors.black54),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
