import 'package:demo_clean_architecture/config/theme/app_theme.dart';
import 'package:demo_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:demo_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:demo_clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:demo_clean_architecture/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        home: const DailyNews(),
      ),
    );
  }
}


