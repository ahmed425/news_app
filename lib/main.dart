import 'package:android_alarm_manager_plus/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/article_details_provider.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/views/home.dart';
import 'package:provider/provider.dart';

import 'providers/article_details_provider.dart';
import 'providers/article_details_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers:[
      ChangeNotifierProvider.value(value: ArticleDetailsProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter News App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),

      ),
    );
  }
}
