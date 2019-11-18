import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/dto/Article.dart';

abstract class BookmarksListInteractor {
  Stream<DomainAction> loadInitial();

  Stream<DomainAction> changeItemBookmarkState(Article article);
}
