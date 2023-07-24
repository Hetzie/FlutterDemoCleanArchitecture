import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleTileMobile extends StatelessWidget {
  final ArticleEntity article;

  const ArticleTileMobile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width:  MediaQuery.of(context).size.width/2,
      constraints: const BoxConstraints(maxWidth: 600, maxHeight: 200),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [_buildImage(context), _buildTitleAndDescription()],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: article.urlToImage ?? "",
        imageBuilder: (context, imageProvider) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 170, maxHeight: 200),
                  width: 130,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 170, maxHeight: 200),
                  width: 130,
                  height: 200,
                  child: CupertinoActivityIndicator(),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                ),
              ),
            ),
        errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 170, maxHeight: 200),
                  width: 130,
                  height: 200,
                  child: Icon(Icons.error),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                ),
              ),
            ));
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Container(
          height: 200,
          constraints: const BoxConstraints(maxWidth: 410, maxHeight: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Text(
                article.title ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Butler',
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),

              // description
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    article.description ?? "",
                    maxLines: 3,
                  ),
                ),
              ),

              // Date & Time
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.timeline_rounded),
                  Text(
                    article.publishedAt ?? "")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
