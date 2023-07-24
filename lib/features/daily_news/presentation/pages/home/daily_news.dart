import 'package:demo_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:demo_clean_architecture/features/daily_news/presentation/widgets/article_tile/article_tile.dart';
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
          return LayoutBuilder(builder: (context, constraints) {
            if (constraints.constrainWidth() < 700) {
              return _mobileList(state);
            } else if (constraints.constrainWidth() < 1200) {
              return _tabList(context, state);
            } else {
              return _desktopList(context, state);
            }
          });
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _mobileList(RemoteArticleState state) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ArticleTileMobile(article: state.articles![index]);
      },
      itemCount: state.articles!.length,
    );
  }

  Widget _tabList(BuildContext context, RemoteArticleState state) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1, mainAxisExtent: 200),
      itemBuilder: (context, index) {
        return ArticleTileMobile(article: state.articles![index]);
      },
      itemCount: state.articles!.length,
    );
  }

  Widget _desktopList(BuildContext context, RemoteArticleState state) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.8, mainAxisExtent: 200),
      itemBuilder: (context, index) {
        return ArticleTileMobile(article: state.articles![index]);
      },
      itemCount: state.articles!.length,
    );
  }
}
