import 'package:news_app/domain/actions/DomainAction.dart';

class UpdateBookmarkAction<T> extends DomainAction {
  String id;
  bool inDatabase;

  UpdateBookmarkAction(this.id, this.inDatabase);
}
