import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String description;
  final String urlToImage;
  final bool inDatabase;

  Article(this.id, this.title, this.description, this.urlToImage, this.inDatabase);

  @override
  List<Object> get props => [title, description, urlToImage, inDatabase];
}
