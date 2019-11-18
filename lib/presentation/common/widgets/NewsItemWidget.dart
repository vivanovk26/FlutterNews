import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';
import 'package:news_app/presentation/screens/detail/ArticleDetailScreen.dart';

class NewsItemWidget extends StatelessWidget {
  // UI sizes
  static const double _ARTICLE_ITEM_CORNER_SIZE = 4.0;
  static const double _ARTICLE_ITEM_ELEVATION_SIZE = 4.0;
  static const double _ARTICLE_ITEM_IMAGE_HEIGHT = 256.0;
  static const double _ARTICLE_ITEM_MARGIN = 16.0;
  static const double _ARTICLE_ITEM_MARGIN_HALF = 8.0;
  static const double _ARTICLE_ITEM_PADDING = 16.0;

  // Text sizes
  static const double _TITLE_FONT_SIZE = 18.0;
  static const int _TITLE_MAX_LINES = 2;
  static const double _DESCRIPTION_FONT_SIZE = 14.0;
  static const int _DESCRIPTION_MAX_LINES = 3;

  // Styles
  static const Color _TEXT_COLOR = Colors.black;
  static const TextStyle _TITLE_STYLE = TextStyle(
    color: _TEXT_COLOR,
    fontSize: _TITLE_FONT_SIZE,
  );
  static const TextStyle _DESCRIPTION_STYLE = TextStyle(
    color: _TEXT_COLOR,
    fontSize: _DESCRIPTION_FONT_SIZE,
  );

  final Article _article;
  final void Function(Article article) _onBookmarkClick;

  NewsItemWidget(this._article, this._onBookmarkClick);

  @override
  Widget build(BuildContext context) {
    return Card(
      // As I suppose we don't need it in StatelessWidget. But it's kind a good practise.
      key: ObjectKey(_article),
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
                      height: _ARTICLE_ITEM_IMAGE_HEIGHT,
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                errorWidget: (context, url, error) =>
                    Container(
                      height: _ARTICLE_ITEM_IMAGE_HEIGHT,
                      child: Icon(Icons.error),
                    )),
          ),
          Padding(
              padding: EdgeInsets.all(_ARTICLE_ITEM_PADDING),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Hero(
                            tag: _article.title,
                            child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  _article.title,
                                  style: _TITLE_STYLE,
                                  maxLines: _TITLE_MAX_LINES,
                                  overflow: TextOverflow.ellipsis,
                                ))),
                        Hero(
                          tag: _article.description,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              _article.description,
                              style: _DESCRIPTION_STYLE,
                              maxLines: _DESCRIPTION_MAX_LINES,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Hero(
                    tag: _article.title + ArticleDetailScreen.HERO_BOOKMARK,
                    child: IconButton(
                      icon: Icon(
                        getBookmarkIcon(_article.inDatabase),
                      ),
                      onPressed: () {
                        _onBookmarkClick(_article);
                      },
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  IconData getBookmarkIcon(bool inDatabase) {
    if (inDatabase) {
      return Icons.bookmark;
    } else {
      return Icons.bookmark_border;
    }
  }
}
