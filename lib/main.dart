import 'package:android_alarm_manager_plus/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/article_details_provider.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/views/home.dart';
import 'package:provider/provider.dart';

void printHello() {
  final DateTime now = DateTime.now();
  print("[$now] Hello, world!  function='$printHello'");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  // WidgetsFlutterBinding.ensureInitialized();
  // final int helloAlarmID = 1;
  // await AndroidAlarmManager.initialize();
  runApp(MyApp());
  // await AndroidAlarmManager.periodic(
  //     const Duration(seconds: 3), helloAlarmID, printHello);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NewsProvider()),
        ChangeNotifierProvider.value(value: ArticleDetailsProvider()),
        ChangeNotifierProvider.value(value: CategoryProvider()),
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
