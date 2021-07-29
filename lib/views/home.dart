import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home_bloc.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/providers/all_news_provider.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/widgets/category_widget.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';
import '../widgets/category_widget.dart';
import '../widgets/news_tile_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetHomeData());
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child:BlocConsumer<HomeBloc , HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder:   (context, state) {
            if (state is HomeInitial) {
              return buildInitial(context);
            } else if (state is HomeLoading) {
              return buildLoading();
            } else if (state is HomeLoaded) {
              return buildColumnWithData(context,state.news,state.category);
            } else {
              // (state is WeatherError)
              return buildInitial(context);
            }
          },

        )
      ),
    );
  }
}

Widget buildInitial(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ChangeNotifierProvider<CategoryProvider>(
        create: (context) => CategoryProvider(),
        child: Consumer<CategoryProvider>(
          builder: (buildContext, categoryProvider, _) {
            print(categoryProvider.categories.toString());
            return (categoryProvider.categories != null)
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryProvider.categories.length,
                    itemBuilder: (ctx, index) {
                      final category = categoryProvider.categories[index];
                      return CategoryWidget(categoryModel: category);
                    })
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    ),
  );
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildNews(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Container(
      height: MediaQuery.of(context).size.height * (5 / 6),
      child: ChangeNotifierProvider<AllNewsProvider>(
        create: (context) => AllNewsProvider(),
        child: Consumer<AllNewsProvider>(
          builder: (buildContext, newsProvider, _) {
            return (newsProvider.allNews != null)
                ? ListView.builder(
                    itemCount: newsProvider.allNews.length,
                    itemBuilder: (ctx, index) {
                      return NewsTileWidget(newsProvider.allNews[index]);
                    })
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    ),
  );
}

Column buildColumnWithData(BuildContext context,List <NewsTileModel> news,List <CategoryModel> categories) {
  return Column(
    children: [
      /// Categories
      buildInitial(context),
      ///  News
      buildNews(context),
    ],
  );
}
