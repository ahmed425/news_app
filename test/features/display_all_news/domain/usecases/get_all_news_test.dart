import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/features/display_all_news/domain/entities/news_item.dart';
import 'package:news_app/features/display_all_news/domain/repositories/news_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/display_all_news/domain/usecases/get_news.dart';
class MockNewsRepository extends Mock
    implements NewsRepository {}
void main() {
  GetNews usecase;
  MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    usecase = GetNews(mockNewsRepository);
  });
  final tNews=[
    NewsItem(imageUrl: "imageUrl", title: "title", desc: "desc", articleUrl: "articleUrl")
  ];
  test(
    'should get all news from the repository',
        () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(mockNewsRepository.getAllNews())
          .thenAnswer((_) async => Right(tNews));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase.execute();
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tNews));
      // Verify that the method has been called on the Repository
      verify(mockNewsRepository.getAllNews());
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNewsRepository);
    },
  );
}
