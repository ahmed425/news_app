import 'package:flutter/material.dart';
import 'package:news_app/views/article_details.dart';

Widget MyAppBar(){
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Flutter ",
          style:
          TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
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


