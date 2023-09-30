

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapi/model/categories_news_model.dart';
import 'package:newsapi/model/news_channels_headlines_model.dart';

class NewsRepository {
  final apiKey = "8bb7077d007f40a69f040d2d91364547";

  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String sourceID) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));
    // if (kDebugMode) {
    //   print(response.body);
    // }

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception("error");
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    String url = 'https://newsapi.org/v2/everything?q=$category&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception("error");
  }
}
