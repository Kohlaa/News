import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/model/NewsResponse.dart';
import 'package:news_application/model/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';

  // https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {'apiKey': '2737c0b010ee4166aae4e359d54c8457', 'category': categoryId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var sourceResponse = SourcesResponse.fromJson(json);
      return sourceResponse;
    } catch (e) {
      throw e;
    }
  }

  //https://newsapi.org/v2/everything?q=apple&from=2022-12-25&to=2022-12-25&sortBy=popularity&apiKey=2737c0b010Future<NFuture<NewsResponse>59d54c8457
  static Future<NewsResponse> getNews(
      {String? sourceId, String? searchKeyword}) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': '2737c0b010ee4166aae4e359d54c8457',
      'sources': sourceId,
      'q': searchKeyword
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (e) {
      throw e;
    }
  }
}
