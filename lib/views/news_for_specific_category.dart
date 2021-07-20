import 'package:flutter/material.dart';
import 'package:news_app/providers/category_news_provider.dart';

// import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/my_app_bar_widget.dart';
import 'package:news_app/widgets/news_tile_widget.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';

class NewsForSpecificCategory extends StatelessWidget {
  final CategoryModel tappedCategory;

  NewsForSpecificCategory(this.tappedCategory);

  @override
  Widget build(BuildContext context) {
    print("build category is" + tappedCategory.categoryName);
    final CategoryNewsProvider categoryNewsProvider =
        new CategoryNewsProvider(tappedCategory.categoryName);
    return Scaffold(
      appBar: myAppBar(),
      body:
          Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ChangeNotifierProvider<CategoryNewsProvider>(
            create: (context) =>
                CategoryNewsProvider(tappedCategory.categoryName),
            child: Consumer<CategoryNewsProvider>(
              builder: (buildContext, categoryNewsProvider, _) {
                print(" category is :" + tappedCategory.categoryName);
                // categoryNewsProvider
                //     .getCategoryNews(tappedCategory.categoryName);
                // print(categoryNewsProvider.categoryNews.toString());
                print("Fetched category news are :" +
                    categoryNewsProvider.categoryNews.toString());
                return (categoryNewsProvider.categoryNews != null)
                    ? ListView.builder(
                        itemCount: categoryNewsProvider.categoryNews.length,
                        itemBuilder: (ctx, index) {
                          print(categoryNewsProvider.categoryNews.toString());

                          return NewsTileWidget(
                              categoryNewsProvider
                                  .categoryNews[index].urlToImage,
                              categoryNewsProvider
                                  .categoryNews[index].description,
                              categoryNewsProvider.categoryNews[index].title);
                        })
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );

    // SafeArea(
    //   child: SingleChildScrollView(
    //     child: Container(
    //       child: Column(
    //         children: <Widget>[
    //           Container(
    //             margin: EdgeInsets.only(top: 16),
    //             child: FutureBuilder(
    //                 // future:
    //                 // providerData
    //                 //     .fetchAndSetNewsForSpecificCategory(newsCategory),
    //                 builder:
    //                     (BuildContext context, AsyncSnapshot snapshot) {
    //                   print(snapshot.data);
    //                   if (snapshot.data == null) {
    //                     return Center(
    //                       child: Container(
    //                           child: Center(
    //                               child: CircularProgressIndicator())),
    //                     );
    //                   } else {
    //                     return ListView.builder(
    //                         itemCount: snapshot.data.length,
    //                         shrinkWrap: true,
    //                         physics: ClampingScrollPhysics(),
    //                         itemBuilder: (context, index) {
    //                           return NewsTileWidget(
    //                               snapshot.data[index].urlToImage,
    //                               snapshot.data[index].title,
    //                               snapshot.data[index].description,
    //                               snapshot.data[index].articleUrl);
    //                         });
    //                   }
    //                 }),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // ));
  }
}

//------------------------------//
// final providerData = Provider.of<NewsProvider>(context);
// print("Tapped Category is " + tappedCategory.categoryName);
// providerData.fetchAndSetNewsForSpecificCategory(newsCategory);
// Container(
//   margin: EdgeInsets.only(top: 16),
//   child:
//
//   FutureBuilder(
//       future: categoryNewsProvider.getCategoryNews(tappedCategory.categoryName)
//           ,
//       builder:
//           (BuildContext context, AsyncSnapshot snapshot) {
//         print("Fetched data is: "+snapshot.data.toString());
//         // if (snapshot.data == null) {
//         //   return Center(
//         //     child: Container(
//         //         child: Center(
//         //             child: CircularProgressIndicator())),
//         //   );
//         // } else {
//           return ListView.builder(
//               itemCount: snapshot.data.length,
//               shrinkWrap: true,
//               physics: ClampingScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Image.network(
//                     snapshot.data[index].urlToImage,
//                     // snapshot.data[index].title,
//                     // snapshot.data[index].description,
//                     );
//               });
//         }
//       ),
// )