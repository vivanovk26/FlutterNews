import 'dart:async';
import 'dart:core';

import 'package:news_app/data/repository/ArticlesRepository.dart';
import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/ErrorAction.dart';
import 'package:news_app/domain/actions/LoadedAction.dart';
import 'package:news_app/domain/actions/LoadingAction.dart';
import 'package:news_app/domain/dto/LoadingType.dart';

class ArticlesListInteractor {
  ArticlesRepository _articlesRepository;

  ArticlesListInteractor(this._articlesRepository);

  Stream<DomainAction> loadInitial() {
    return _loadArticles(LoadingType.FirstPage);
  }

  Stream<DomainAction> _loadArticles(LoadingType loadingType, {String searchText}) async* {
    try {
      yield LoadingAction.show();
      yield LoadedAction(await _articlesRepository.getArticles());
    } catch (error) {
      yield ErrorAction(error);
    } finally {
      yield LoadingAction.hide();
    }
  }

  Stream<DomainAction> refresh() {
    return _loadArticles(LoadingType.Refresh);
  }
}
