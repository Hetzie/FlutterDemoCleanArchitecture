import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:demo_clean_architecture/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:demo_clean_architecture/features/daily_news/domain/usecases/remove_article.dart';
import 'package:demo_clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:equatable/equatable.dart';

import 'local_article_state.dart';

part 'local_article_event.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticlesState> {

  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SavedArticleUseCase _saveArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._removeArticleUseCase, this._saveArticleUseCase) : super(LocalArticlesLoading()){

    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  Future<void> onGetSavedArticles(GetSavedArticles event, Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  Future<FutureOr<void>> onRemoveArticle(RemoveArticle event, Emitter<LocalArticlesState> emit) async {
    await _removeArticleUseCase(params: event.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  Future<FutureOr<void>> onSaveArticle(SaveArticle event, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: event.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}