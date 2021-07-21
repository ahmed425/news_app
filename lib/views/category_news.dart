import 'package:flutter/material.dart';
import 'package:news_app/providers/category_news_provider.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';

class CategoryNews extends StatelessWidget {
  final CategoryModel tappedCategory;

  CategoryNews(this.tappedCategory);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ChangeNotifierProvider<CategoryNewsProvider>(
            create: (context) =>
                CategoryNewsProvider(tappedCategory.categoryName),
            child: Consumer<CategoryNewsProvider>(
              builder: (buildContext, categoryNewsProvider, _) {
                print(" category is :" + tappedCategory.categoryName);
                return (categoryNewsProvider.categoryNews != null)
                    ? ListView.builder(
                        itemCount: categoryNewsProvider.categoryNews.length,
                        itemBuilder: (ctx, index) {
                          print(categoryNewsProvider.categoryNews.toString());
                          return NewsTileWidget(
                              categoryNewsProvider.categoryNews[index]);
                        })
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}