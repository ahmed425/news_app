import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/data/models/news_tile_model.dart';
import 'package:news_app/data/repositories/HomeRepository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  final List <CategoryModel> categories;

  HomeBloc(this._homeRepository, this.categories) : super(HomeInitial(categories));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetHomeData) {
      try {
        yield HomeLoading();
        final homeNews = await _homeRepository.fetchNews();
        final homeCat =  _homeRepository.fetchCategories();

        yield HomeLoaded(homeNews,homeCat);
      } on NetworkException {
        yield HomeError("Couldn't fetch weather. Is the device online?");
      }
    }
  }
}