import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/presentation/detail/ArticleDetailScreen.dart';

class AppRouter {
  Route articleDetailRoute(Article article) {
    return PageRouteBuilder(
      settings: RouteSettings(
        name: ArticleDetailScreen.ARTICLE_ROUTE,
        arguments: article,
      ),
      pageBuilder: (context, animation, secondaryAnimation) => ArticleDetailScreen(),
      transitionsBuilder: (context, animation, endAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
