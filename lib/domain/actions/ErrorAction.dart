import 'package:news_app/domain/dto/LoadingType.dart';

import 'DomainAction.dart';

class ErrorAction extends DomainAction {
  LoadingType loadingType;
  Exception exception;

  ErrorAction(this.loadingType, this.exception);
}
