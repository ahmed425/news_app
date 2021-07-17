import 'package:flutter/material.dart';
import 'package:news_app/helper/AllNews.dart';

import 'article_details.dart';

class CategoryNews extends StatefulWidget {

  final String newsCategory;

  CategoryNews({this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist;
  bool _loading = true;

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }

  void getNews() async {
    NewsForCategorie news = NewsForCategorie();
    await news.getNewsForCategory(widget.newsCategory);
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.share,)),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child: Container(
          child: Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: newslist.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return NewsTile(
                    imageUrl: newslist[index].urlToImage ?? "",
                    title: newslist[index].title ?? "",
                    desc: newslist[index].description ?? "",
                    articleUrl: newslist[index].articleUrl ?? "",
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imageUrl, title, desc, articleUrl;
//
  NewsTile(
      {@required this.imageUrl, @required this.title, @required this.desc, @required this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ArticleDetails(
              articleUrl: articleUrl,
            )));
      },
      child: Container(

        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(imageUrl,errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                return Icon(Icons.do_not_disturb);
              },),
              borderRadius: BorderRadius.circular(16),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:news_app/helper/AllNews.dart';
// import 'package:news_app/helper/NewsForSpecificCategory.dart';
// import 'package:news_app/models/article_model.dart';
//
// import 'article_details.dart';
//
// class NewsForSpecificCategoryPage extends StatefulWidget {
//   final String newsCategory;
// NewsForSpecificCategoryPage({this.newsCategory});
//
//   @override
//   _NewsForSpecificCategoryPageState createState() => _NewsForSpecificCategoryPageState();
// }
//
// class _NewsForSpecificCategoryPageState extends State<NewsForSpecificCategoryPage> {
//   List<ArticleModel> articles=new List<ArticleModel>();
//   bool _loading=true;
//   var newslist;
//
//   // void getNews(String newsCategoryName) async {
//   //   NewsForSpecificCategory news = NewsForSpecificCategory();
//   //   await news.getNewsForCategory(widget.newsCategory);
//   //   // articles = news.news;
//   //   setState(() {
//   //     _loading = false;
//   //   });
//   // }
//   void getNews() async {
//     NewsForCategorie news = NewsForCategorie();
//     await news.getNewsForCategory(widget.newsCategory.toLowerCase());
//     newslist = news.news;
//     setState(() {
//       _loading = false;
//     });
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     getNews();
//
//     super.initState();
//  }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//         _loading
//             ? Center(
//             child: Container(
//               child: CircularProgressIndicator(),
//             ))
//         :
//         SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 Container(
//                   child: ListView.builder(
//                     shrinkWrap: true,
// // scrollDirection: Axis.versioningrtical,
//                     physics: ClampingScrollPhysics(),
//                     padding: EdgeInsets.only(top: 16, left: 16, right: 16),
//                     itemBuilder: (context, index) {
//                       return NewsTile(
//                         imageUrl: articles[index].urlToImage,
//                         title: articles[index].title,
//                         desc: articles[index].description,
//                         articleUrl: articles[index].url,
//                       );
//                     },
//                     itemCount: articles.length,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         appBar: AppBar(
//             elevation: 0.0,
//             title: Text(
//               "Flutter News App",
//               style: TextStyle(color: Colors.blue),
//             ),
//             centerTitle: true));
//   }
// }
// class NewsTile extends StatelessWidget {
//   final String imageUrl, title, desc, articleUrl;
//
//   NewsTile(
//       {@required this.imageUrl, @required this.title, @required this.desc, @required this.articleUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) =>
//             ArticleDetails(
//               articleUrl: articleUrl,
//             )));
//       },
//       child: Container(
//
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
//
