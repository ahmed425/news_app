import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NewsItem extends Equatable {
  final String imageUrl, title, desc, articleUrl;

  NewsItem(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.articleUrl}):super([imageUrl,title,desc,articleUrl]);
}
