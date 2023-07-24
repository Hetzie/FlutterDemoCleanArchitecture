import 'dart:convert';

import 'package:demo_clean_architecture/core/constants/constants.dart';
import 'package:demo_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category
  });
  // @GET('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3d6d307f460748f7845079345ae02a47')
  // Future<HttpResponse<List<ArticleModel>>> getNewsArticles();

}

