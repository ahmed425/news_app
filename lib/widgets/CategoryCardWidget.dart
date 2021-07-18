import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/providers/home_page_provider.dart';
import 'package:news_app/views/display_news_for_specificcategory.dart';
import 'package:provider/provider.dart';
class CategoryWidget extends StatelessWidget {

   String _imageAssetUrl;
    String _categoryName ;

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<HomePageProvider>(context);
// providerData.getCategories();
    return GestureDetector(
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(
      //       builder: (context) => CategoryNews(
      //         newsCategory: providerData.,
      //       )
      //   ));
      // },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: _imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26
              ),
              child: Text(
               _categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

   CategoryWidget(this._imageAssetUrl, this._categoryName);
}
