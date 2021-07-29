import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/data/models/news_tile_model.dart';
import 'package:news_app/data/repositories/category_news_repository.dart';
import 'package:news_app/ui/category_news/category_news_bloc.dart';
import 'package:news_app/ui/home/home_bloc.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';

import '../../data/models/category_model.dart';

class CategoryNews extends StatelessWidget {
  final CategoryModel tappedCategory;
// List<NewsTileModel> news;
  CategoryNews(this.tappedCategory);
// CategoryNewsRepository categoryNewsRepository;

  @override
  Widget build(BuildContext context) {
    Fluttertoast.showToast(
      msg: tappedCategory.categoryName,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
    context.read<CategoryNewsBloc>().add(GetCategoryNews(tappedCategory.categoryName));

    return Scaffold(
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: BlocConsumer<CategoryNewsBloc, CategoryNewsState>(
            listener: (context, state) {
              if (state is HomeError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Error"),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is CategoryNewsLoaded) {
                return buildNews(context, state.news);
              } else {
                // (state is WeatherError)
                return Text("Hi");
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget buildNews(BuildContext context, List<NewsTileModel> news) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Container(
      height: MediaQuery.of(context).size.height * (5 / 6),
      child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (ctx, index) {
            return NewsTileWidget(news[index]);
          }),
    ),
  );
}
