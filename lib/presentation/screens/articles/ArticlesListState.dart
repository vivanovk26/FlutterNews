import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/di/NewsAppModule.dart';
import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/EmptyData.dart';
import 'package:news_app/domain/dto/ErrorData.dart';
import 'package:news_app/domain/dto/ListData.dart';
import 'package:news_app/domain/interactors/articles/ArticlesListInteractor.dart';
import 'package:news_app/presentation/common/delegates/state/EmptyStateDelegate.dart';
import 'package:news_app/presentation/common/delegates/state/ErrorStateDelegate.dart';
import 'package:news_app/presentation/common/delegates/state/LoadingStateDelegate.dart';
import 'package:news_app/presentation/screens/articles/ArticlesListScreen.dart';
import 'package:news_app/presentation/screens/articles/ArticlesListStateDelegate.dart';

class ArticlesListState extends State<ArticlesListScreen> {
  // Fields
  bool _loading = true;
  ListData<Article> _listData = ListData.hide();
  EmptyData _emptyData = EmptyData.hide();
  ErrorData _errorData = ErrorData.hide();

  // Delegates
  final LoadingStateDelegate _loadingStateDelegate = LoadingStateDelegate();
  final ArticlesListStateDelegate _listStateDelegate = ArticlesListStateDelegate();
  final EmptyStateDelegate _emptyStateDelegate = EmptyStateDelegate();
  final ErrorStateDelegate _errorStateDelegate = ErrorStateDelegate();

  // Domain
  final ArticlesListInteractor _articlesListInteractor = NewsAppModule().getArticlesListInteractor();
  final StreamController<DomainAction> _streamController = StreamController();

  @override
  void initState() {
    super.initState();

    _reduce(_articlesListInteractor.loadInitial());
  }

  void _reduce(Stream<DomainAction> actions) async {
    await for (DomainAction action in actions) {
      final loading = _loadingStateDelegate.reduce(action);
      final listData = _listStateDelegate.reduceArticles(action, _listData.items);
      final emptyData = _emptyStateDelegate.reduce(context, action);
      final errorData = _errorStateDelegate.reduce(action);
      setState(() {
        if (loading != null) {
          this._loading = loading;
        }
        if (listData != null) {
          this._listData = listData;
        }
        if (emptyData != null) {
          this._emptyData = emptyData;
        }
        if (errorData != null) {
          this._errorData = errorData;
        }
      });
      _streamController.add(action);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_loading) widget.buildLoading(),
        if (_listData.visible) widget.buildArticles(_listData, _onBookmarkClick, _onRefresh),
        if (_emptyData.visible) widget.buildEmptyWidget(_emptyData, _loadInitial),
        if (_errorData.visible) widget.buildErrorWidget(_errorData, _loadInitial)
      ],
    );
  }

  Future<void> _loadInitial() async {
    return _reduce(_articlesListInteractor.loadInitial());
  }

  void _onBookmarkClick(Article article) {
    _reduce(_articlesListInteractor.changeItemBookmarkState(article));
  }

  Future<void> _onRefresh() async {
    return _reduce(_articlesListInteractor.refresh());
  }

  @override
  void dispose() {
    _streamController.close();

    super.dispose();
  }
}
