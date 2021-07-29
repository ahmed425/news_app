import 'package:flutter/material.dart';
import 'package:news_app/data/models/news_tile_model.dart';
import 'package:news_app/ui/widgets/my_app_bar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetails extends StatelessWidget {
  final NewsTileModel newsTileModel;

  ArticleDetails(this.newsTileModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: newsTileModel.articleUrl,
          ),
        ],
      ),
    );
  }
}
