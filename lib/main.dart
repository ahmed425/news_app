import 'package:android_alarm_manager_plus/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repositories/category_news_repository.dart';
import 'package:news_app/ui/category_news/category_news.dart';
import 'package:news_app/ui/category_news/category_news_bloc.dart';
import 'package:news_app/ui/home/home_bloc.dart';
import 'package:news_app/data/repositories/HomeRepository.dart';
import 'package:news_app/ui/home/home.dart';
import 'package:news_app/widgets/category_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return HomeBloc(HomeRepositoryImplementation(),
                            HomeRepositoryImplementation().categories);
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return CategoryNewsBloc(
                            CategoryNewsRepositoryImplementation()
            );
          },
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );

    //   MaterialApp(
    //   title: 'Flutter News App',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primaryColor: Colors.white,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   home: MultiBlocProvider(
    //     providers: [
    //       BlocProvider(
    //         child: HomePage(),
    //         create: (context) => HomeBloc(HomeRepositoryImplementation(),
    //             HomeRepositoryImplementation().categories),
    //       ),
    //       BlocProvider(
    //         child: CategoryNews(CategoryWidget().categoryModel),
    //         create: (context) => CategoryNewsBloc(
    //             CategoryNewsRepositoryImplementation(),
    //             CategoryWidget().categoryModel.categoryName,
    //             CategoryNewsRepositoryImplementation().categoryNews),
    //       ),
    //
    //
    //     ],
    //   ),
    // );
  }
}
