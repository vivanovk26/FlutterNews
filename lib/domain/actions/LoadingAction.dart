import 'package:news_app/domain/dto/LoadingType.dart';

import 'DomainAction.dart';

class LoadingAction extends DomainAction {
  bool loading;
  LoadingType loadingType;

  LoadingAction._internal(this.loading, this.loadingType);

  LoadingAction.show(LoadingType loadingType) : this._internal(true, loadingType);

  LoadingAction.hide(LoadingType loadingType) : this._internal(false, loadingType);
}
