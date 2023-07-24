part of 'local_article_bloc.dart';

abstract class LocalArticleEvent extends Equatable {

  final ArticleEntity? article;

  LocalArticleEvent(this.article);

  @override
  List<Object?> get props => [article!];

}

class GetSavedArticles extends LocalArticleEvent{
  GetSavedArticles(super.article);
}

class RemoveArticle extends LocalArticleEvent{
  RemoveArticle(super.article);
}

class SaveArticle extends LocalArticleEvent{
  SaveArticle(super.article);
}
