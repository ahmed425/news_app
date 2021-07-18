import 'package:flutter/material.dart';
import 'package:news_app/providers/article_details_provider.dart';
import 'package:news_app/providers/home_page_provider.dart';
import 'package:news_app/views/home.dart';
import 'package:provider/provider.dart';
// const myTask = "syncWithTheBackEnd";
// void callbackDispatcher() {
// // this method will be called every hour
//   Workmanager.executeTask((task, inputdata) async {
//     switch (task) {
//       case myTask:
//         print("this method was called from native!");
//         Fluttertoast.showToast(msg: "this method was called from native!");
//         break;
//
//       case Workmanager.iOSBackgroundTask:
//         print("iOS background fetch delegate ran");
//         break;
//     }
//
//     //Return true when the task executed successfully or not
//     return Future.value(true);
//   });
// }
void main() {
  // needs to be initialized before using workmanager package
  // WidgetsFlutterBinding.ensureInitialized();

  // initialize Workmanager with the function which you want to invoke after any periodic time
  // Workmanager.initialize(callbackDispatcher);

  // Periodic task registration
  // Workmanager.registerPeriodicTask(
  //   "2",
    // use the same task name used in callbackDispatcher function for identifying the task
    // Each task must have a unique name if you want to add multiple tasks;
    // myTask,
    // When no frequency is provided the default 15 minutes is set.
    // Minimum frequency is 15 min.
    // Android will automatically change your frequency to 15 min if you have configured a lower frequency than 15 minutes.
    // frequency: Duration(seconds: 3), // change duration according to your needs
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
     ChangeNotifierProvider.value(value:HomePageProvider()),
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

