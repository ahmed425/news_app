import 'package:flutter/material.dart';
import 'package:news_app/providers/article_details_provider.dart';
import 'package:news_app/views/article_details.dart';
import 'package:provider/provider.dart';

import '../models/NewsTileModel.dart';

class NewsTileWidget extends StatelessWidget {
 // NewsTileModel newsTileModel;
 //
 // NewsTileWidget(this.newsTileModel);
final String imageUrl,desc,title;

NewsTileWidget(this.imageUrl, this.desc, this.title);

  @override
  Widget build(BuildContext context) {
    // final providerData = Provider.of<ArticleDetailsProvider>(context);

    return GestureDetector(
      onTap: () {
        // providerData.setUrl(_articleUrl);
        // Navigator.push(context, MaterialPageRoute(builder: (context) =>
        //     ArticleDetails(
        //     )));
      },
      child: Container(
padding: EdgeInsets.all(10),
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
