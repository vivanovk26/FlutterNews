import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/ErrorAction.dart';
import 'package:news_app/domain/actions/LoadedAction.dart';
import 'package:news_app/domain/dto/ListData.dart';

/**
 * Returns EmptyData for handled actions, null otherwise.
 * Helps to react on Actions and change ListData.
 */
class ListStateDelegate<T> {
  ListData<T> reduce(DomainAction action) {
    if (action is LoadedAction) {
      if (action.items.isEmpty) {
        return ListData.hide();
      } else {
        return ListData.show(action.items);
      }
    } else if (action is ErrorAction) {
      return ListData.hide();
    }
    return null;
  }
}
