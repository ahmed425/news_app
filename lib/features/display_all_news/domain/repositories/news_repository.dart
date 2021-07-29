import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/display_all_news/domain/entities/news_item.dart';


abstract class NewsRepository {
  Future<Either<Failure, List<NewsItem>>> getAllNews();
}