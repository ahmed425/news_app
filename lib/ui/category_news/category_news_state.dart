part of 'category_news_bloc.dart';

@immutable
abstract class CategoryNewsState {
  const CategoryNewsState();
}
class CategoryNewsLoaded extends CategoryNewsState {
  final List <NewsTileModel> news;
  CategoryNewsLoaded(this.news);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoryNewsLoaded && o.news == news ;
  }

  @override
  int get hashCode => news.hashCode;
}

class CategoryNewsError extends CategoryNewsState {
  final String message;
  const CategoryNewsError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoryNewsError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
