import 'DomainAction.dart';

class LoadedAction<T> extends DomainAction {
  List<T> items;

  LoadedAction(this.items);
}
