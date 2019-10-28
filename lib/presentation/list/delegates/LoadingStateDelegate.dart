import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/LoadingAction.dart';
import 'package:news_app/domain/dto/LoadingType.dart';

class LoadingStateDelegate {
  bool reduce(DomainAction action) {
    if (action is LoadingAction && action.loadingType == LoadingType.FirstPage) {
      return action.loading;
    }
    return null;
  }
}
