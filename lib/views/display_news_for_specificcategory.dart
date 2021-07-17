import 'package:flutter/material.dart';
import 'package:news_app/helper/NewsForSpecificCategory.dart';
import 'package:news_app/models/article_model.dart';

import 'article_details.dart';

class NewsForSpecificCategoryPage extends StatefulWidget {
  final String newsCategory;
NewsForSpecificCategoryPage({this.newsCategory});

  @override
  _NewsForSpecificCategoryPageState createState() => _NewsForSpecificCategoryPageState();
}

class _NewsForSpecificCategoryPageState extends State<NewsForSpecificCategoryPage> {
  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;
  var newslist;

  // void getNews(String newsCategoryName) async {
  //   NewsForSpecificCategory news = NewsForSpecificCategory();
  //   await news.getNewsForCategory(widget.newsCategory);
  //   // articles = news.news;
  //   setState(() {
  //     _loading = false;
  //   });
  // }
  void getNews() async {
    NewsForSpecificCategory news = NewsForSpecificCategory();
    await news.getNewsForCategory(widget.newsCategory.toLowerCase());
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getNews();

    super.initState();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        _loading
            ? Center(
            child: Container(
              child: CircularProgressIndicator(),
            ))
        :
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
// scrollDirection: Axis.versioningrtical,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    itemBuilder: (context, index) {
                      return NewsItem(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        articleUrl: articles[index].url,
                      );
                    },
                    itemCount: articles.length,
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
            elevation: 0.0,
            title: Text(
              "Flutter News App",
              style: TextStyle(color: Colors.blue),
            ),
            centerTitle: true));
  }
}
class NewsItem extends StatelessWidget {
  final String imageUrl, title, desc, articleUrl;

  NewsItem(
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
              child: Image.network(imageUrl),
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

