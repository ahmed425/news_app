import 'package:flutter/material.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/providers/article_details_provider.dart';
import 'package:news_app/views/article_details.dart';
import 'package:provider/provider.dart';

class NewsTileWidget extends StatelessWidget {
  final NewsTileModel newsTileModel;
 NewsTileWidget(this.newsTileModel);
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ArticleDetailsProvider>(context);

    return GestureDetector(
      onTap: () {
        providerData.setUrl(newsTileModel.articleUrl);
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
              child: Image.network(newsTileModel.imageUrl,errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                return Icon(Icons.do_not_disturb);
              },),
              borderRadius: BorderRadius.circular(16),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              newsTileModel.title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              newsTileModel.desc,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
