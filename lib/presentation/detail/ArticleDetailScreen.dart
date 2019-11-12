import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';

class ArticleDetailScreen extends StatelessWidget {
  // Navigation
  static const String ARTICLE_ROUTE = "ARTICLE_ROUTE";

  // UI sizes
  static const double _IMAGE_HEIGHT = 256.0;
  static const double _TEXT_PADDING = 16.0;

  // Text sizes
  static const double _DESCRIPTION_FONT_SIZE = 14.0;
  static const double _TITLE_FONT_SIZE = 18.0;

  // Styles
  static const Color _TEXT_COLOR = Colors.black;
  static const TextStyle _TITLE_STYLE = TextStyle(
    color: _TEXT_COLOR,
    fontSize: _TITLE_FONT_SIZE,
  );
  static const TextStyle _DESCRIPTION_STYLE = const TextStyle(
    color: _TEXT_COLOR,
    fontSize: _DESCRIPTION_FONT_SIZE,
  );

  @override
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: _IMAGE_HEIGHT,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                  child: Hero(
                    tag: article.urlToImage,
                    child: CachedNetworkImage(
                      height: _IMAGE_HEIGHT,
                      imageUrl: article.urlToImage,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Container(
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            )
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(_TEXT_PADDING),
          child: Column(
            children: <Widget>[
              Hero(
                  tag: article.title,
                  // For clear share transition.
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      article.title,
                      style: _TITLE_STYLE,
                    ),
                  )),
              Hero(
                tag: article.description,
                // For clear share transition.
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    article.description,
                    style: _DESCRIPTION_STYLE,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
