import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String description;
  final String urlToImage;
  final DateTime date;
  final bool inDatabase;

  Article(this.id, this.title, this.description, this.urlToImage, this.date, this.inDatabase);

  @override
  List<Object> get props => [title, description, urlToImage, this.date, inDatabase];
}
