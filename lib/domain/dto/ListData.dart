class ListData<T> {
  bool visible;
  List<T> items;

  ListData._internal(this.visible, this.items);

  ListData.show(List<T> items) : this._internal(true, items);

  ListData.hide() : this._internal(false, List());
}
