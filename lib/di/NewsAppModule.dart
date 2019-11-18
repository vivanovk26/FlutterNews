import 'package:news_app/data/mappers/ApiEntityMapper.dart';
import 'package:news_app/data/mappers/ApiEntityMapperImpl.dart';
import 'package:news_app/data/mappers/DatabaseEntityMapper.dart';
import 'package:news_app/data/mappers/DatabaseEntityMapperImpl.dart';
import 'package:news_app/data/network/services/ApiService.dart';
import 'package:news_app/data/network/services/ApiServiceImpl.dart';
import 'package:news_app/data/network/services/DatabaseService.dart';
import 'package:news_app/data/network/services/DatabaseServiceImpl.dart';
import 'package:news_app/data/repository/ArticlesRepository.dart';
import 'package:news_app/data/repository/ArticlesRepositoryImpl.dart';
import 'package:news_app/domain/interactors/articles/ArticlesListInteractor.dart';
import 'package:news_app/domain/interactors/articles/ArticlesListInteractorImpl.dart';
import 'package:news_app/domain/interactors/bookmarks/BookmarksListInteractor.dart';
import 'package:news_app/domain/interactors/bookmarks/BookmarksListInteractorImpl.dart';

class NewsAppModule {
  static final NewsAppModule _newsAppModule = NewsAppModule._internal();

  factory NewsAppModule() {
    return _newsAppModule;
  }

  NewsAppModule._internal();

  // Data.
  ApiEntityMapper _apiEntityMapper;
  ApiService _apiService;
  DatabaseEntityMapper _databaseEntityMapper;
  DatabaseService _databaseService;
  ArticlesRepository _articlesRepository;

  // Domain.
  ArticlesListInteractor _articlesListInteractor;
  BookmarksListInteractor _bookmarksListInteractor;

  // Single.
  ApiEntityMapper _getApiEntityMapper() {
    if (_apiEntityMapper == null) {
      _apiEntityMapper = ApiEntityMapperImpl();
    }
    return _apiEntityMapper;
  }

  // Single.
  ApiService _getApiService() {
    if (_apiService == null) {
      _apiService = ApiServiceImpl(_getApiEntityMapper());
    }
    return _apiService;
  }

  DatabaseEntityMapper _getDatabaseEntityMapper() {
    if (_databaseEntityMapper == null) {
      _databaseEntityMapper = DatabaseEntityMapperImpl();
    }
    return _databaseEntityMapper;
  }

  DatabaseService _getDatabaseService() {
    if (_databaseService == null) {
      _databaseService = DatabaseServiceImpl(_getDatabaseEntityMapper());
    }
    return _databaseService;
  }

  // Single.
  ArticlesRepository _getArticlesRepository() {
    if (_articlesRepository == null) {
      _articlesRepository = ArticlesRepositoryImpl(_getApiService(), _getDatabaseService());
    }
    return _articlesRepository;
  }

  // Single.
  ArticlesListInteractor getArticlesListInteractor() {
    if (_articlesListInteractor == null) {
      _articlesListInteractor = ArticlesListInteractorImpl(_getArticlesRepository());
    }
    return _articlesListInteractor;
  }

  BookmarksListInteractor getBookmarksListInteractor() {
    if (_bookmarksListInteractor == null) {
      _bookmarksListInteractor = BookmarksListInteractorImpl(_getArticlesRepository());
    }
    return _bookmarksListInteractor;
  }
}
