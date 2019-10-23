import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/Article.dart';

class ArticlesListItemWidget extends StatelessWidget {
  static const double _ARTICLE_ITEM_HEIGHT = 256.0;
  static const double _ARTICLE_ITEM_PADDING = 16.0;
  static const double _TITLE_FONT_SIZE = 18.0;
  static const int _TITLE_MAX_LINES = 2;
  static const double _DESCRIPTION_FONT_SIZE = 14.0;
  static const int _DESCRIPTION_MAX_LINES = 2;

  final TextStyle _titleStyle = const TextStyle(color: Colors.white, fontSize: _TITLE_FONT_SIZE);
  final TextStyle _descriptionStyle = const TextStyle(color: Colors.white, fontSize: _DESCRIPTION_FONT_SIZE);

  final Article _article;

  ArticlesListItemWidget(this._article);

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: ObjectKey(_article), // As I suppose we don't need it in StatelessWidget. But it's kind a good practise.
      alignment: Alignment(1, 1),
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: _article.urlToImage,
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(color: Colors.grey),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: _ARTICLE_ITEM_HEIGHT,
        ),
        Padding(
            padding: EdgeInsets.all(_ARTICLE_ITEM_PADDING),
            child: Column(children: <Widget>[
              Text(
                _article.title,
                style: _titleStyle,
                maxLines: _TITLE_MAX_LINES,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
              Text(
                _article.description,
                style: _descriptionStyle,
                maxLines: _DESCRIPTION_MAX_LINES,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              )
            ]))
      ],
    );
  }
}
