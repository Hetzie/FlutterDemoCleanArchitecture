import 'package:bloc/bloc.dart';
import 'package:demo_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:demo_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:demo_clean_architecture/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        "Daily News",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RemoteArticlesError) {
          return const Center(child: Icon(Icons.refresh));
        } else if (state is RemoteArticlesDone) {
          var width = MediaQuery.of(context).size.width;
          if (width >700){
            return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleTile(article: state.articles![index]);
              },
              itemCount: state.articles!.length,
            );
          }else{
            return GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                childAspectRatio: (3/1),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,), itemBuilder: (context, index) {
                return ArticleTile(article: state.articles![index],);
              },
              itemCount: state.articles!.length,
            );
          }

        } else {
          return const SizedBox();
        }
      },
    );
  }
}
