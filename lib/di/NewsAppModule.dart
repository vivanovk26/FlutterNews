import 'package:news_app/data/mappers/ApiEntityMapper.dart';
import 'package:news_app/data/mappers/ApiEntityMapperImpl.dart';
import 'package:news_app/data/network/services/ApiService.dart';
import 'package:news_app/data/network/services/ApiServiceImpl.dart';
import 'package:news_app/data/repository/ArticlesRepository.dart';
import 'package:news_app/data/repository/ArticlesRepositoryImpl.dart';
import 'package:news_app/domain/interactors/ArticlesListInteractor.dart';
import 'package:news_app/domain/interactors/ArticlesListInteractorImpl.dart';

class NewsAppModule {
  static final NewsAppModule _newsAppModule = NewsAppModule._internal();

  factory NewsAppModule() {
    return _newsAppModule;
  }

  NewsAppModule._internal();

  ApiEntityMapper _apiEntityMapper;
  ApiService _apiService;
  ArticlesRepository _articlesRepository;
  ArticlesListInteractor _articlesListInteractor;

  // Single
  ApiEntityMapper getApiEntityMapper() {
    if (_apiEntityMapper == null) {
      _apiEntityMapper = ApiEntityMapperImpl();
    }
    return _apiEntityMapper;
  }

  // Single
  ApiService getApiService() {
    if (_apiService == null) {
      _apiService = ApiServiceImpl(getApiEntityMapper());
    }
    return _apiService;
  }

  // Single
  ArticlesRepository getArticlesRepository() {
    if (_articlesRepository == null) {
      _articlesRepository = ArticlesRepositoryImpl(getApiService());
    }
    return _articlesRepository;
  }

  // Single
  ArticlesListInteractor getArticlesListInteractor() {
    if (_articlesListInteractor == null) {
      _articlesListInteractor = ArticlesListInteractorImpl(getArticlesRepository());
    }
    return _articlesListInteractor;
  }
}
