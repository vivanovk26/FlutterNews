import 'dart:async';
import 'dart:core';

import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/dto/Article.dart';

abstract class ArticlesListInteractor {
  Stream<DomainAction> loadInitial();

  Stream<DomainAction> changeItemBookmarkState(Article article);

  Stream<DomainAction> refresh();
}
