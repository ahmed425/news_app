import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetails extends StatefulWidget {
final String articleUrl;

   ArticleDetails({this.articleUrl});
  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final Completer<WebViewController> _completer=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Flutter News App",
            style: TextStyle(color: Colors.blue),
          ),
          centerTitle: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebView(
        initialUrl: widget.articleUrl,
        onWebViewCreated: ((WebViewController webViewController){
          _completer.complete(webViewController);
        }),
      ),),
    );
  }
}