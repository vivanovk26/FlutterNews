import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/UpdateBookmarkAction.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/ListData.dart';
import 'package:news_app/presentation/common/delegates/state/ListStateDelegate.dart';

/**
 * Only remove article from list.
 */
class BookmarksListStateDelegate extends ListStateDelegate<Article> {
  ListData<Article> reduceArticles(DomainAction action, List<Article> items) {
    if (action is UpdateBookmarkAction) {
      int index = items.indexWhere((item) {
        return item.id == action.id;
      });
      items.removeAt(index);
      return ListData.show(items);
    } else {
      return super.reduce(action);
    }
  }
}
