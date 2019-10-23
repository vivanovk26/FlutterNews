class ErrorData {
  bool visible;
  Exception exception;

  ErrorData._internal(this.visible, this.exception);

  ErrorData.show(Exception exception) : this._internal(true, exception);

  ErrorData.hide() : this._internal(false, null);
}
