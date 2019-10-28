import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';

class ArticlesListItemWidget extends StatelessWidget {

  // UI
  static const double _ARTICLE_ITEM_CORNER_SIZE = 4.0;
  static const double _ARTICLE_ITEM_ELEVATION_SIZE = 4.0;
  static const double _ARTICLE_ITEM_IMAGE_HEIGHT = 256.0;
  static const double _ARTICLE_ITEM_MARGIN = 16.0;
  static const double _ARTICLE_ITEM_MARGIN_HALF = 8.0;
  static const double _ARTICLE_ITEM_PADDING = 16.0;

  // Text
  static const double _TITLE_FONT_SIZE = 18.0;
  static const int _TITLE_MAX_LINES = 2;
  static const double _DESCRIPTION_FONT_SIZE = 14.0;
  static const int _DESCRIPTION_MAX_LINES = 3;

  final TextStyle _titleStyle = const TextStyle(
    color: Colors.black,
    fontSize: _TITLE_FONT_SIZE,
  );
  final TextStyle _descriptionStyle = const TextStyle(
    color: Colors.black,
    fontSize: _DESCRIPTION_FONT_SIZE,
  );

  final Article _article;

  ArticlesListItemWidget(this._article);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ObjectKey(_article), // As I suppose we don't need it in StatelessWidget. But it's kind a good practise.
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: _ARTICLE_ITEM_ELEVATION_SIZE,
      margin: EdgeInsets.symmetric(vertical: _ARTICLE_ITEM_MARGIN_HALF, horizontal: _ARTICLE_ITEM_MARGIN),
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_ARTICLE_ITEM_CORNER_SIZE),
      ),
      child: Column(
        children: <Widget>[
          Hero(
            tag: _article.urlToImage,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: _ARTICLE_ITEM_IMAGE_HEIGHT,
              imageUrl: _article.urlToImage,
              placeholder: (context, url) =>
                  Container(
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_ARTICLE_ITEM_PADDING),
            child: Column(
              children: <Widget>[
                Hero(
                    tag: _article.title,
                    child: Material(
                        color: Colors.transparent,
                        child: Text(
                          _article.title,
                          style: _titleStyle,
                          maxLines: _TITLE_MAX_LINES,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                        ))),
                Hero(
                  tag: _article.description,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      _article.description,
                      style: _descriptionStyle,
                      maxLines: _DESCRIPTION_MAX_LINES,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
