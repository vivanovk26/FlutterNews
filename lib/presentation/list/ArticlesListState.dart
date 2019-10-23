import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/app/AppLocalizations.dart';
import 'package:news_app/data/mappers/ApiEntityMapper.dart';
import 'package:news_app/data/network/services/ApiService.dart';
import 'package:news_app/data/repository/ArticlesRepository.dart';
import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/EmptyData.dart';
import 'package:news_app/domain/dto/ErrorData.dart';
import 'package:news_app/domain/dto/ListData.dart';
import 'package:news_app/domain/interactors/ArticlesListInteractor.dart';
import 'package:news_app/presentation/list/ArticlesListScreen.dart';
import 'package:news_app/presentation/list/delegates/EmptyStateDelegate.dart';
import 'package:news_app/presentation/list/delegates/ErrorStateDelegate.dart';
import 'package:news_app/presentation/list/delegates/ListStateDelegate.dart';
import 'package:news_app/presentation/list/delegates/LoadingStateDelegate.dart';

class ArticlesListState extends State<ArticlesListScreen> {
  // Fields
  bool _loading = true;
  ListData _listData = ListData.hide();
  EmptyData _emptyData = EmptyData.hide();
  ErrorData _errorData = ErrorData.hide();

  // Delegates
  final LoadingStateDelegate _loadingStateDelegate = LoadingStateDelegate();
  final ListStateDelegate<Article> _listStateDelegate = ListStateDelegate();
  EmptyStateDelegate _emptyStateDelegate;
  final ErrorStateDelegate _errorStateDelegate = ErrorStateDelegate();

  // Domain
  final ArticlesListInteractor _articlesListInteractor =
      ArticlesListInteractor(ArticlesRepository(ApiService(ApiEntityMapper())));
  final StreamController<DomainAction> _streamController = StreamController();

  @override
  void initState() {
    super.initState();

    _emptyStateDelegate = EmptyStateDelegate(context);
    _render(_articlesListInteractor.loadInitial());
  }

  void _render(Stream<DomainAction> actions) async {
    await for (DomainAction action in actions) {
      final loading = _loadingStateDelegate.reduce(action);
      final listData = _listStateDelegate.reduce(action);
      final emptyData = _emptyStateDelegate.reduce(action);
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
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).getString("app_name")),
        ),
        body: RefreshIndicator(
            child: Stack(children: [
              if (_loading) Center(child: widget.buildLoading()),
              if (_emptyData.visible) Center(child: widget.buildEmptyWidget(_emptyData)),
              if (_errorData.visible) Center(child: widget.buildErrorWidget(_errorData)),
              if (_listData.visible) widget.buildArticles(_listData)
            ]),
            onRefresh: _onRefreshCallback));
  }

  Future<void> _onRefreshCallback() async {
    return _render(_articlesListInteractor.refresh());
  }

  @override
  void dispose() {
    _streamController.close();

    super.dispose();
  }
}
