import 'package:news_app/domain/dto/LoadingType.dart';

import 'DomainAction.dart';

class ErrorAction extends DomainAction {
  LoadingType loadingType;
  Error error;

  ErrorAction(this.loadingType, this.error);
}
