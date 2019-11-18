import 'package:news_app/data/repository/ArticlesRepository.dart';
import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/ErrorAction.dart';
import 'package:news_app/domain/actions/LoadedAction.dart';
import 'package:news_app/domain/actions/LoadingAction.dart';
import 'package:news_app/domain/actions/UpdateBookmarkAction.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/LoadingType.dart';
import 'package:news_app/domain/interactors/bookmarks/BookmarksListInteractor.dart';

class BookmarksListInteractorImpl implements BookmarksListInteractor {
  ArticlesRepository _articlesRepository;

  BookmarksListInteractorImpl(this._articlesRepository);

  @override
  Stream<DomainAction> loadInitial() {
    return _loadArticles(LoadingType.FirstPage);
  }

  Stream<DomainAction> _loadArticles(LoadingType loadingType, {String searchText}) async* {
    yield LoadingAction.show(loadingType);
    try {
      yield LoadedAction(await _articlesRepository.getBookmarks());
    } catch (error) {
      yield ErrorAction(loadingType, error);
    }
    yield LoadingAction.hide(loadingType);
  }

  @override
  Stream<DomainAction> changeItemBookmarkState(Article article) async* {
    yield LoadingAction.show(LoadingType.FirstPage);
    try {
      bool inDatabase = await _articlesRepository.changeItemBookmarkState(article);
      _articlesRepository.updateBookmarkIdInCache(article.id);
      yield UpdateBookmarkAction(article.id, inDatabase);
    } catch (error) {
      yield ErrorAction(LoadingType.FirstPage, error);
    }
    yield LoadingAction.hide(LoadingType.FirstPage);
  }
}
