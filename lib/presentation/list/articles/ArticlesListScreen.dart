import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/EmptyData.dart';
import 'package:news_app/domain/dto/ErrorData.dart';
import 'package:news_app/domain/dto/ListData.dart';
import 'package:news_app/presentation/list/articles/ArticlesListState.dart';
import 'package:news_app/presentation/list/widgets/ArticlesListWidget.dart';
import 'package:news_app/presentation/list/widgets/EmptyWidget.dart';
import 'package:news_app/presentation/list/widgets/ErrorDataWidget.dart';

class ArticlesListScreen extends StatefulWidget {
  @override
  ArticlesListState createState() => ArticlesListState();

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildArticles(ListData<Article> articles, Future<void> Function() onRefresh) {
    return ArticlesListWidget(articles, onRefresh);
  }

  Widget buildEmptyWidget(EmptyData emptyData, Future<void> Function() onReload) {
    return EmptyWidget(emptyData, onReload);
  }

  Widget buildErrorWidget(ErrorData errorData, Future<void> Function() onReload) {
    return ErrorDataWidget(errorData, onReload);
  }
}
