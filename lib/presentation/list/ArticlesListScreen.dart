import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/EmptyData.dart';
import 'package:news_app/domain/dto/ErrorData.dart';
import 'package:news_app/domain/dto/ListData.dart';
import 'package:news_app/presentation/list/ArticlesListState.dart';
import 'package:news_app/presentation/list/widgets/ArticlesListWidget.dart';
import 'package:news_app/presentation/list/widgets/EmptyWidget.dart';
import 'package:news_app/presentation/list/widgets/ErrorDataWidget.dart';

class ArticlesListScreen extends StatefulWidget {
  @override
  ArticlesListState createState() => ArticlesListState();

  Widget buildLoading() => CircularProgressIndicator();

  Widget buildArticles(ListData<Article> articles) => ArticlesListWidget(articles);

  Widget buildEmptyWidget(EmptyData emptyData) => EmptyWidget(emptyData);

  Widget buildErrorWidget(ErrorData errorData) => ErrorDataWidget(errorData);
}
