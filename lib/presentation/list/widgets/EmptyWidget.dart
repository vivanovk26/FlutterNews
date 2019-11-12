import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/app/AppLocalizations.dart';
import 'package:news_app/domain/dto/EmptyData.dart';

class EmptyWidget extends StatelessWidget {
  // Text sizes
  static const double _TITLE_FONT_SIZE = 16.0;
  static const double _SUB_TITLE_FONT_SIZE = 12.0;
  static const double _BUTTON_FONT_SIZE = 14.0;

  // Styles
  static const Color _TEXT_COLOR = Colors.black;
  static const TextStyle _TITLE_STYLE = TextStyle(
    color: _TEXT_COLOR,
    fontSize: _TITLE_FONT_SIZE,
  );
  static const TextStyle _SUB_TITLE_STYLE = TextStyle(
    color: _TEXT_COLOR,
    fontSize: _SUB_TITLE_FONT_SIZE,
  );
  static const TextStyle _BUTTON_STYLE = TextStyle(
    color: _TEXT_COLOR,
    fontSize: _BUTTON_FONT_SIZE,
  );

  final EmptyData _emptyData;
  final Future<void> Function() _onReload;

  EmptyWidget(this._emptyData, this._onReload);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.inbox),
          Text(
            _emptyData.title,
            style: _TITLE_STYLE,
            textAlign: TextAlign.center,
          ),
          Text(
            _emptyData.description,
            style: _SUB_TITLE_STYLE,
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text(
              AppLocalizations.of(context).getString("empty_state_retry"),
              style: _BUTTON_STYLE,
            ),
            onPressed: _onReload,
          )
        ],
      ),
    );
  }
}
