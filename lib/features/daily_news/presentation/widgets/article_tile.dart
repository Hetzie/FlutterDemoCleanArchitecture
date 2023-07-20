import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;

  const ArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.2,
      padding: EdgeInsets.all(5),
      child: Row(
        children: [_buildImage(context), _buildTitleAndDescription()],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: article.urlToImage ??
            "https://s.abcnews.com/images/US/powerball-gty-bb-230719_1689772625730_hpMain_16x9_992.jpg",
        imageBuilder: (context, imageProvider) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
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
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
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
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
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
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  article.description ?? "",
                  maxLines: 2,
                ),
              ),
            ),

            // Date & Time
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.timeline_rounded),
                Text(article.publishedAt ?? "")
              ],
            )
          ],
        ),
      ),
    );
  }
}
