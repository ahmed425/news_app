import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/providers/article_details_provider.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetails extends StatelessWidget {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();


  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ArticleDetailsProvider>(context);
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebView(
          initialUrl:providerData.articleUrl ,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}

// class ArticleDetails extends StatefulWidget {
// final String articleUrl;
//
//    ArticleDetails({this.articleUrl});
//   @override
//   _ArticleDetailsState createState() => _ArticleDetailsState();
// }

// class _ArticleDetailsState extends State<ArticleDetails> {
//   final Completer<WebViewController> _completer=Completer<WebViewController>();
//   @override
//   Widget build(BuildContext context) {
//     return
//
//     Scaffold(
//       appBar: MyAppBar(),
//       body:
//
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: WebView(
//         initialUrl: widget.articleUrl,
//         onWebViewCreated: ((WebViewController webViewController){
//           _completer.complete(webViewController);
//         }),
//       ),),
//     );
//   }
// }
