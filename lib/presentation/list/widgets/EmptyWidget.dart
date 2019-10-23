import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/domain/dto/EmptyData.dart';

class EmptyWidget extends StatelessWidget {
  static const double _TITLE_FONT_SIZE = 16.0;
  static const double _SUB_TITLE_MAX_LINES = 12.0;

  final TextStyle _titleStyle = const TextStyle(color: Colors.black, fontSize: _TITLE_FONT_SIZE);
  final TextStyle _subTitleStyle = const TextStyle(color: Colors.black, fontSize: _SUB_TITLE_MAX_LINES);

  final EmptyData _emptyData;

  EmptyWidget(this._emptyData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(Icons.info),
        Text(_emptyData.title, style: _titleStyle, textAlign: TextAlign.center),
        Text(
          _emptyData.description,
          style: _subTitleStyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
