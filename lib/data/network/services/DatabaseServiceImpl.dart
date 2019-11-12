import 'package:news_app/data/mappers/DatabaseEntityMapper.dart';
import 'package:news_app/data/network/services/DatabaseService.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServiceImpl extends DatabaseService {
  static const String _ARTICLES_TABLE = "articles";
  static const String _DATABASE_FILE = "articles.db";
  static const int _DATABASE_VERSION = 1;

  Database get _database => _requireDatabase();
  Database _cachedDatabase;
  final DatabaseEntityMapper _databaseEntityMapper;

  DatabaseServiceImpl(this._databaseEntityMapper);

  Database _requireDatabase() {
    if (_cachedDatabase == null) {
      _initDatabase()
          .then((database) => _cachedDatabase = database)
          .catchError((error) => print("Error while openning database: $error"));
    }
    return _cachedDatabase;
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
  Future<void> insertArticle(Article article) async {
    await _database.insert(
      _ARTICLES_TABLE,
      _databaseEntityMapper.mapArticleToEntity(article),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Article>> getArticles() async {
    final List<Map<String, dynamic>> entities = await _database.query(_ARTICLES_TABLE);
    return entities.map((entity) => _databaseEntityMapper.mapEntityToArticle(entity));
  }

  @override
  Future<void> deleteArticle(String articleId) async {
    await _database.delete(
      _ARTICLES_TABLE,
      where: "id = ?",
      whereArgs: [articleId],
    );
  }
}
