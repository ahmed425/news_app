part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();
}


class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List <NewsTileModel> news;
final List <CategoryModel> category;
  HomeLoaded(this.news,this.category);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HomeLoaded && o.news == news && o.category==category;
  }

  @override
  int get hashCode => news.hashCode;
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HomeError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
