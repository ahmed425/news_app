import 'package:flutter/material.dart';
import 'package:news_app/providers/article_details_provider.dart';
import 'package:news_app/views/article_details.dart';
import 'package:provider/provider.dart';

class NewsTileWidget extends StatelessWidget {
  String _imageUrl;
  String _articleUrl;

  NewsTileWidget(this._imageUrl, this._title, this._desc, this._articleUrl);
  String _title ;
  String _desc;
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ArticleDetailsProvider>(context);

    return GestureDetector(
      onTap: () {
        // ArticleModel articleModel=new ArticleModel();
        // articleModel.articleUrl=_articleUrl;
        providerData.setUrl(_articleUrl);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ArticleDetails(

            )));
      },
      child: Container(
padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(_imageUrl,errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                return Icon(Icons.do_not_disturb);
              },),
              borderRadius: BorderRadius.circular(16),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              _title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              _desc,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
