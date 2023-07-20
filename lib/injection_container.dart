import 'package:demo_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:demo_clean_architecture/features/daily_news/data/repository/article_repository_implemantation.dart';
import 'package:demo_clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:demo_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/daily_news/domain/repository/article_repository.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  s1.registerSingleton<Dio>(Dio());

  // Dependencies
  s1.registerSingleton<NewsApiService>(NewsApiService(s1()));
  s1.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(s1()));

  // UseCases
  s1.registerSingleton<GetArticleUseCase>(GetArticleUseCase(s1()));

  // Bloc
  s1.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(s1()));
}