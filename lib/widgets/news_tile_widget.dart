// import 'package:flutter/material.dart';
// import 'package:news_app/views/article_details.dart';
//
// class NewsTileWidget extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) =>
//             ArticleDetails(
//               articleUrl: articleUrl,
//             )));
//       },
//       child: Container(
//
//         margin: EdgeInsets.only(bottom: 16),
//         child: Column(
//           children: [
//             ClipRRect(
//               child: Image.network(imageUrl,errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
//                 return Icon(Icons.do_not_disturb);
//               },),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.black87,
//                   fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               desc,
//               style: TextStyle(color: Colors.black54),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
