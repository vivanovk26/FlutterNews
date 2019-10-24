import 'package:equatable/equatable.dart';

class Article extends Equatable {
  String title;
  String description;
  String urlToImage;

  Article(this.title, this.description, this.urlToImage);

  @override
  List<Object> get props => [title, description, urlToImage];
}
