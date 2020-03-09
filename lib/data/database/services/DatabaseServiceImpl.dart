import 'package:news_app/data/database/mappers/DatabaseEntityMapper.dart';
import 'package:news_app/data/database/services/DatabaseService.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServiceImpl implements DatabaseService {
  // Core
  static const String _ARTICLES_TABLE = "articles";
  static const String _DATABASE_FILE = "articles.db";
  static const int _DATABASE_VERSION = 1;

  // Fields
  // Article (it's better to use different field names in case we use embedded instances later).
  static const String _ARTICLE_ID = "article_id";
  static const String _ARTICLE_DATE = "article_date";
  static const String _ARTICLE_DESCRIPTION = "article_description";
  static const String _ARTICLE_TITLE = "article_title";
  static const String _ARTICLE_URL_TO_IMAGE = "article_url_to_image";

  Database _cachedDatabase;
  final DatabaseEntityMapper _databaseEntityMapper;

  DatabaseServiceImpl(this._databaseEntityMapper);

  Future<Database> _requireDatabase() {
    if (_cachedDatabase == null) {
      return _initDatabase()
          .then((database) => _cachedDatabase = database)
          .catchError((error) => print("Error while openning database: $error"));
    } else {
      return Future.value(_cachedDatabase);
    }
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _DATABASE_FILE),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE articles("
              "$_ARTICLE_ID TEXT PRIMARY KEY, "
              "$_ARTICLE_TITLE TEXT, "
              "$_ARTICLE_DESCRIPTION TEXT, "
              "$_ARTICLE_URL_TO_IMAGE TEXT, "
              "$_ARTICLE_DATE INTEGER"
              ")",
        );
      },
      version: _DATABASE_VERSION,
    );
  }

  @override
  Future<List<String>> getArticleIds() {
    return _requireDatabase().then((database) {
      return database.query(
        _ARTICLES_TABLE,
        columns: [_ARTICLE_ID],
      ).then((entities) {
        return List.generate(entities.length, (i) {
          return entities[i][_ARTICLE_ID];
        });
      });
    });
  }

  @override
  Future<List<Article>> getArticles() {
    return _requireDatabase().then((database) {
      return database.query(_ARTICLES_TABLE).then((entities) {
        return List.generate(entities.length, (i) {
          return _databaseEntityMapper.mapEntityToArticle(entities[i]);
        });
      });
    });
  }

  @override
  Future<int> insertArticle(Article article) {
    return _requireDatabase().then(
          (database) {
        return database.insert(
          _ARTICLES_TABLE,
          _databaseEntityMapper.mapArticleToEntity(article),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      },
    );
  }

  @override
  Future<int> deleteArticle(String articleId) {
    return _requireDatabase().then(
          (database) {
        return database.delete(
          _ARTICLES_TABLE,
          where: "$_ARTICLE_ID = ?",
          whereArgs: [articleId],
        );
      },
    );
  }
}
