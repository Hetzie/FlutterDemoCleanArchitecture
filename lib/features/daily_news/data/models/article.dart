import 'dart:html';

import 'package:demo_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';
//
// class ArticleModel extends ArticleEntity {
//   const ArticleModel({
//     String? author,
//     String? title,
//     String? description,
//     String? url,
//     String? urlToImage,
//     String? publishedAt,
//     String? content,
//   });
//
//   factory ArticleModel.fromJson(Map<String, dynamic> map) {
//     return ArticleModel(
//         author: map['author'] ?? "",
//         title: map['title'] ?? "",
//         description: map['description'] ?? "",
//         url: map['url'] ?? "",
//         urlToImage: map['urlToImage'] ?? "",
//         publishedAt: map['publishedAt'] ?? "",
//         content: map['content'] ?? "");
//   }
// }
//
// class Source {
//   Source({
//     String? id,
//     String? name,
//   });
// }

@Entity(tableName: 'articles', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  int? id;
  // Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleModel(
      {this.id,
        // this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    // source = json['source'] != null ? new Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      publishedAt: entity.publishedAt,
      title: entity.title,
      urlToImage: entity.urlToImage,
      url: entity.url,
      content: entity.content,
      description: entity.description
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.source != null) {
    //   data['source'] = this.source!.toJson();
    // }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }

}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}