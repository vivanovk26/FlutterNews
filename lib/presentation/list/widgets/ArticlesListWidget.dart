import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/ListData.dart';

import 'ArticlesListItemWidget.dart';

class ArticlesListWidget extends StatelessWidget {
  final ListData<Article> _articlesData;

  ArticlesListWidget(this._articlesData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _articlesData.items.length,
        itemBuilder: (BuildContext context, int position) => ArticlesListItemWidget(_articlesData.items[position]));
  }
}
