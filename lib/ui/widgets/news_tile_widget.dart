import 'package:flutter/material.dart';
import 'package:news_app/data/models/news_tile_model.dart';
import 'package:news_app/ui/article_details.dart';

class NewsTileWidget extends StatelessWidget {
  final NewsTileModel newsTileModel;

  NewsTileWidget(this.newsTileModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleDetails(
              newsTileModel,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(
                newsTileModel.imageUrl,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace stackTrace) {
                  return Icon(Icons.do_not_disturb);
                },
              ),
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
