part of 'remote_article_bloc.dart';

@immutable
abstract class RemoteArticleEvent {
  const RemoteArticleEvent();
}

class GetArticles extends RemoteArticleEvent{
  const GetArticles();
}
