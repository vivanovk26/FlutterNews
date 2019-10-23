class EmptyData {
  final bool visible;
  final String title;
  final String description;

  EmptyData._internal(this.visible, this.title, this.description);

  EmptyData.show(String title, String description) : this._internal(true, title, description);

  EmptyData.hide() : this._internal(false, "", "");
}
