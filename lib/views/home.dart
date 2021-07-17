import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/AllNews.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/article_details.dart';
import 'package:news_app/views/display_news_for_specificcategory.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // var news_appList;
  bool _loading = true;

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  void getNews() async {
    AllNews news = AllNews();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _loading
            ? Center(
                child: Container(
                child: CircularProgressIndicator(),
              ))
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 70,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CategoryItem(
                                categoryImageUrl:
                                    categories[index].categoryImageUrl,
                                categoryName: categories[index].categoryName,
                              );
                            }),
                      ),
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
// scrollDirection: Axis.versioningrtical,
                          physics: ClampingScrollPhysics(),
                          padding:
                              EdgeInsets.only(top: 16, left: 16, right: 16),
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

class CategoryItem extends StatelessWidget {
  final categoryName, categoryImageUrl;

  CategoryItem({this.categoryName, this.categoryImageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => NewsForSpecificCategoryPage(
              newsCategory: categoryName.toLowerCase(),
            )
        ));
      },
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => NewsForSpecificCategoryPage(
      //               newsCategory: categoryName.toString().toLowerCase())));


      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: categoryImageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
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

class NewsItem extends StatelessWidget {
  final String imageUrl, title, desc, articleUrl;

  NewsItem(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleDetails(
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
