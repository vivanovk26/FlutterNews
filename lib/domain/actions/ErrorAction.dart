import 'DomainAction.dart';

class ErrorAction extends DomainAction {
  Exception exception;

  ErrorAction(this.exception);
}
