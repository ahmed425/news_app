import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/display_all_news/domain/entities/news_item.dart';
import 'package:news_app/features/display_all_news/domain/repositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  GetNews(this.repository);

  Future<Either<Failure, List<NewsItem>>> execute() async {
    return await repository.getAllNews();
  }
}
