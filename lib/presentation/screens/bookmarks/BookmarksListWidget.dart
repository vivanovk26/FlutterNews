import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/ListData.dart';
import 'package:news_app/navigation/AppRouter.dart';
import 'package:news_app/presentation/common/widgets/NewsItemWidget.dart';

class BookmarksListWidget extends StatelessWidget {
  final ListData<Article> _bookmarksData;
  final void Function(Article article) _onBookmarkClick;

  BookmarksListWidget(this._bookmarksData, this._onBookmarkClick);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: _bookmarksData.items.length,
        itemBuilder: (BuildContext context, int position) => GestureDetector(
          child: NewsItemWidget(_bookmarksData.items[position], _onBookmarkClick),
          onTap: () => Navigator.push(context, AppRouter().articleDetailRoute(_bookmarksData.items[position])),
        ),
      ),
    );
  }
}
