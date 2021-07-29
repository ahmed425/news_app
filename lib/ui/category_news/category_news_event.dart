part of 'category_news_bloc.dart';

@immutable
abstract class CategoryNewsEvent {}
class GetCategoryNews extends CategoryNewsEvent{
  final String categoryName;

  GetCategoryNews(this.categoryName);
}
