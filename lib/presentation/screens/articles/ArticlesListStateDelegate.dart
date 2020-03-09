import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/UpdateBookmarkAction.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/domain/dto/ListData.dart';
import 'package:news_app/presentation/common/delegates/state/ListStateDelegate.dart';

/**
 * Change article database state.
 */
class ArticlesListStateDelegate extends ListStateDelegate<Article> {
  ListData<Article> reduceArticles(DomainAction action, List<Article> items) {
    if (action is UpdateBookmarkAction) {
      int index = items.indexWhere((item) {
        return item.id == action.id;
      });
      Article oldItem = items[index];
      Article newItem = Article(
        oldItem.id,
        oldItem.title,
        oldItem.description,
        oldItem.urlToImage,
        oldItem.date,
        action.inDatabase,
      );
      items[index] = newItem;
      return ListData.show(items);
    } else {
      return super.reduce(action);
    }
  }
}
