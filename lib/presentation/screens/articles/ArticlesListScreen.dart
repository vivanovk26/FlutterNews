import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/EmptyData.dart';
import 'package:news_app/domain/dto/ErrorData.dart';
import 'package:news_app/domain/dto/ListData.dart';
import 'package:news_app/presentation/common/widgets/EmptyWidget.dart';
import 'package:news_app/presentation/common/widgets/ErrorDataWidget.dart';

import 'ArticlesListState.dart';
import 'ArticlesListWidget.dart';

class ArticlesListScreen extends StatefulWidget {
  ArticlesListScreen(Key key) : super(key: key);

  @override
  ArticlesListState createState() => ArticlesListState();

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildArticles(ListData<Article> articles,
      void Function(Article article) onBookmarkClick,
      Future<void> Function() onRefresh,) {
    return ArticlesListWidget(articles, onBookmarkClick, onRefresh);
  }

  Widget buildEmptyWidget(EmptyData emptyData, Future<void> Function() onReload) {
    return EmptyWidget(emptyData, onReload);
  }

  Widget buildErrorWidget(ErrorData errorData, Future<void> Function() onReload) {
    return ErrorDataWidget(errorData, onReload);
  }
}
