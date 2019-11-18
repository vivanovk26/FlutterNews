import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/EmptyData.dart';
import 'package:news_app/domain/dto/ErrorData.dart';
import 'package:news_app/domain/dto/ListData.dart';
import 'package:news_app/presentation/common/widgets/EmptyWidget.dart';
import 'package:news_app/presentation/common/widgets/ErrorDataWidget.dart';
import 'package:news_app/presentation/screens/bookmarks/BookmarksListWidget.dart';

import 'BookmarksListState.dart';

class BookmarksListScreen extends StatefulWidget {
  BookmarksListScreen(Key key) : super(key: key);

  @override
  BookmarksListState createState() => BookmarksListState();

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildBookmarks(
    ListData<Article> bookmarks,
    void Function(Article article) onBookmarkClick,
  ) {
    return BookmarksListWidget(bookmarks, onBookmarkClick);
  }

  Widget buildEmptyWidget(EmptyData emptyData, Future<void> Function() onReload) {
    return EmptyWidget(emptyData, onReload);
  }

  Widget buildErrorWidget(ErrorData errorData, Future<void> Function() onReload) {
    return ErrorDataWidget(errorData, onReload);
  }
}
