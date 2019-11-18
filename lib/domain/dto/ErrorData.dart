import 'package:news_app/domain/dto/LoadingType.dart';

class ErrorData {
  bool visible;
  LoadingType loadingType;
  Error error;

  ErrorData._internal(this.visible, this.loadingType, this.error);

  ErrorData.show(LoadingType loadingType, Error error) : this._internal(true, loadingType, error);

  ErrorData.hide({LoadingType loadingType, Error error}) : this._internal(false, loadingType, error);
}
