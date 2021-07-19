import 'package:flutter/material.dart';
import 'package:news_app/providers/article_details_provider.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ArticleDetailsProvider>(context);
    return Scaffold(
      appBar: myAppBar(),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: providerData.articleUrl,
          ),
        ],
      ),
    );
  }
}
