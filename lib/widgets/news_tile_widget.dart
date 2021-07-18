import 'package:flutter/material.dart';
import 'package:news_app/views/article_details.dart';

// ignore: must_be_immutable
class NewsTileWidget extends StatelessWidget {
  String _imageUrl;

  NewsTileWidget(this._imageUrl, this._title, this._desc, this._articleUrl);

  // ignore: unnecessary_getters_setters
  String get imageUrl => _imageUrl;

  // ignore: unnecessary_getters_setters
  set imageUrl(String value) {
    _imageUrl = value;
  }

  String _title ;
  String _desc;
  String _articleUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ArticleDetails(
              articleUrl,
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

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get desc => _desc;

  set desc(String value) {
    _desc = value;
  }

  String get articleUrl => _articleUrl;

  set articleUrl(String value) {
    _articleUrl = value;
  }
}
