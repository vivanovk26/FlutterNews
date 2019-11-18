import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/ErrorAction.dart';
import 'package:news_app/domain/actions/LoadedAction.dart';
import 'package:news_app/domain/actions/LoadingAction.dart';
import 'package:news_app/domain/dto/ErrorData.dart';
import 'package:news_app/domain/dto/LoadingType.dart';

/**
 * Returns EmptyData for handled actions, null otherwise.
 * Helps to react on Actions and change ErrorData.
 */
class ErrorStateDelegate {
  ErrorData reduce(DomainAction action) {
    if (action is LoadingAction && action.loading) {
      return ErrorData.hide();
    } else if (action is LoadedAction) {
      return ErrorData.hide();
    } else if (action is ErrorAction) {
      if (action.loadingType == LoadingType.FirstPage) {
        return ErrorData.show(action.loadingType, action.error);
      } else {
        return ErrorData.hide(loadingType: action.loadingType, error: action.error);
      }
    }
    return null;
  }
}