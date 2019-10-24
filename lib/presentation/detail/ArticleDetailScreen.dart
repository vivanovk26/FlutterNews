import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';

class ArticleDetailScreen extends StatelessWidget {
  // Navigation
  static const String ARTICLE_ROUTE = "ARTICLE_ROUTE";

  // UI
  static const double _TEXT_PADDING = 16.0;
  static const double _TITLE_FONT_SIZE = 18.0;
  static const double _DESCRIPTION_FONT_SIZE = 14.0;

  final TextStyle _titleStyle = const TextStyle(color: Colors.black, fontSize: _TITLE_FONT_SIZE);
  final TextStyle _descriptionStyle = const TextStyle(color: Colors.black, fontSize: _DESCRIPTION_FONT_SIZE);

  @override
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Hero(
                            tag: article.urlToImage,
                            child: CachedNetworkImage(
                              imageUrl: article.urlToImage,
                              placeholder: (context, url) => Container(
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ))))
              ];
            },
            body: Padding(
                padding: EdgeInsets.all(_TEXT_PADDING),
                child: Column(children: <Widget>[
                  Hero(
                      tag: article.title,
                      child: Material(color: Colors.transparent, child: Text(article.title, style: _titleStyle))),
                  Hero(
                      tag: article.description,
                      child: Material(
                          color: Colors.transparent,
                          child: Text(
                            article.description,
                            style: _descriptionStyle,
                          )))
                ]))));
  }
}
