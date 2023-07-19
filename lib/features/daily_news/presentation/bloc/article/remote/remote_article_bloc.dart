import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_clean_architecture/core/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../domain/entities/article.dart';
import '../../../../domain/usecases/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {

  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticlesLoading()) {

    on<GetArticles>(onGetArticles);
  }

  Future<FutureOr<void>> onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dateState = await _getArticleUseCase();

    if (dateState is DataSuccess && dateState.data!.isNotEmpty){
      emit(RemoteArticlesDone(dateState.data!));
    }

    if (dateState is DataFailed) {
      emit(RemoteArticlesError(dateState.error!));
    }

  }
}
