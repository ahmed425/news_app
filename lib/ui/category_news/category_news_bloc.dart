import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data/models/news_tile_model.dart';
import 'package:news_app/data/repositories/category_news_repository.dart';

part 'category_news_event.dart';
part 'category_news_state.dart';

class CategoryNewsBloc extends Bloc<CategoryNewsEvent, CategoryNewsState> {
  final CategoryNewsRepository categoryNewsRepository;
  // final List <NewsTileModel> newsList;
  CategoryNewsBloc(this.categoryNewsRepository) : super(CategoryNewsError("nj,bhjc"));

  @override
  Stream<CategoryNewsState> mapEventToState(
    CategoryNewsEvent event,
  ) async* {
    if (event is GetCategoryNews) {
      try {
        // yield HomeLoading();
        print("event category name is "+event.categoryName);
        final categoryNews = await categoryNewsRepository.getCategoryNews(event.categoryName);

        yield CategoryNewsLoaded(categoryNews);
      } on NetworkException {
      }
    }
  }
    // TODO: implement mapEventToState
  }





  // final CategoryNewsRepository _CategoryNewsRepository;
  // final List <NewsTileModel> category;
  //
  // HomeBloc(this._CategoryNewsRepository, this.category) : super(HomeInitial(category));
  //
  // @override
  // Stream<HomeState> mapEventToState(HomeEvent event) async* {
  //   if (event is GetCategoryNews) {
  //     try {
  //       yield HomeLoading();
  //       final categoryNews = await _CategoryNewsRepository.fetchNews();
  //       final homeCat =  _CategoryNewsRepository.fetchCategories();
  //
  //       yield CategoryNewsLoaded(categoryNews,homeCat);
  //     } on NetworkException {
  //       yield HomeError("Couldn't fetch weather. Is the device online?");
  //     }
  //   }
  // }

