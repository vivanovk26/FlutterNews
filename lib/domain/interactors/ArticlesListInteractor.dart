import 'dart:async';
import 'dart:core';

import 'package:news_app/domain/actions/DomainAction.dart';

abstract class ArticlesListInteractor {
  Stream<DomainAction> loadInitial();

  Stream<DomainAction> refresh();
}
