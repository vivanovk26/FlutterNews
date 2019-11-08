import 'package:news_app/domain/dto/LoadingType.dart';

class ErrorData {
  bool visible;
  LoadingType loadingType;
  Exception exception;

  ErrorData._internal(this.visible, this.loadingType, this.exception);

  ErrorData.show(LoadingType loadingType, Exception exception) : this._internal(true, loadingType, exception);

  ErrorData.hide({LoadingType loadingType, Exception exception}) : this._internal(false, loadingType, exception);
}
