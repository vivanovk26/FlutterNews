import 'package:news_app/data/repository/ArticlesRepository.dart';
import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/ErrorAction.dart';
import 'package:news_app/domain/actions/LoadedAction.dart';
import 'package:news_app/domain/actions/LoadingAction.dart';
import 'package:news_app/domain/dto/LoadingType.dart';
import 'package:news_app/domain/interactors/ArticlesListInteractor.dart';

class ArticlesListInteractorImpl implements ArticlesListInteractor {
  ArticlesRepository _articlesRepository;

  ArticlesListInteractorImpl(this._articlesRepository);

  Stream<DomainAction> loadInitial() {
    return _loadArticles(LoadingType.FirstPage);
  }

  Stream<DomainAction> _loadArticles(LoadingType loadingType, {String searchText}) async* {
    yield LoadingAction.show(loadingType);
    try {
      yield LoadedAction(await _articlesRepository.getArticles());
    } catch (error) {
      yield ErrorAction(error);
    }
    yield LoadingAction.hide(loadingType);
  }

  Stream<DomainAction> refresh() {
    return _loadArticles(LoadingType.Refresh);
  }
}
