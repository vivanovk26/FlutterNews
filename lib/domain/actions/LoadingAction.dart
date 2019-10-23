import 'DomainAction.dart';

class LoadingAction extends DomainAction {
  bool loading;

  LoadingAction._internal(this.loading);

  LoadingAction.show() : this._internal(true);

  LoadingAction.hide() : this._internal(false);
}
