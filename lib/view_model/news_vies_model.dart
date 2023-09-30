
import 'package:newsapi/model/categories_news_model.dart';
import 'package:newsapi/model/news_channels_headlines_model.dart';
import 'package:newsapi/repository/news_repository.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String sourceId) async {
    final response = await _rep.fetchNewsChannelHeadlinesApi(sourceId);
    return response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response;
  }
}
