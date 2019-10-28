import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String description;
  final String urlToImage;

  Article(this.title, this.description, this.urlToImage);

  @override
  List<Object> get props => [title, description, urlToImage];
}
