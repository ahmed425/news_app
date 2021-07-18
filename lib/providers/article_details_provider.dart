import 'package:flutter/cupertino.dart';

class ArticleDetailsProvider with ChangeNotifier{
  String articleUrl;
void setUrl(String url){
  articleUrl=url;
}
}