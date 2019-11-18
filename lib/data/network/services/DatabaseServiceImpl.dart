import 'package:news_app/data/mappers/DatabaseEntityMapper.dart';
import 'package:news_app/data/network/services/DatabaseService.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServiceImpl implements DatabaseService {
  static const String _ARTICLES_TABLE = "articles";
  static const String _DATABASE_FILE = "articles.db";
  static const int _DATABASE_VERSION = 1;

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
          "CREATE TABLE articles(id TEXT PRIMARY KEY, title TEXT, description TEXT, urlToImage TEXT)",
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
        columns: ["id"],
      ).then((entities) {
        return List.generate(entities.length, (i) {
          return entities[i]["id"];
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
          where: "id = ?",
          whereArgs: [articleId],
        );
      },
    );
  }
}
