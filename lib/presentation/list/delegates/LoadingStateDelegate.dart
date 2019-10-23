import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/LoadingAction.dart';

class LoadingStateDelegate {
  bool reduce(DomainAction action) {
    if (action is LoadingAction) {
      return action.loading;
    }
    return null;
  }
}
