import 'package:flutter/cupertino.dart';

class ArticleDetailsProvider with ChangeNotifier{
  String articleUrl;
  bool _loading=true;

  set loading(bool value) {
    _loading = value;
  }

  bool get loading => _loading;

  void setUrl(String url){
  articleUrl=url;
}
}