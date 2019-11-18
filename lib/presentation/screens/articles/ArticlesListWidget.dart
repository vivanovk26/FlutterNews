import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/ListData.dart';
import 'package:news_app/navigation/AppRouter.dart';
import 'package:news_app/presentation/common/widgets/NewsItemWidget.dart';

class ArticlesListWidget extends StatelessWidget {
  final ListData<Article> _articlesData;
  final void Function(Article article) _onBookmarkClick;
  final Future<void> Function() _onRefresh;

  ArticlesListWidget(this._articlesData,
      this._onBookmarkClick,
      this._onRefresh,);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: _articlesData.items.length,
        itemBuilder: (BuildContext context, int position) =>
            GestureDetector(
              child: NewsItemWidget(_articlesData.items[position], _onBookmarkClick),
              onTap: () => Navigator.push(context, AppRouter().articleDetailRoute(_articlesData.items[position])),
            ),
      ),
      onRefresh: _onRefresh,
    );
  }
}
