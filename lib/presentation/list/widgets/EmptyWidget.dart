import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/app/AppLocalizations.dart';
import 'package:news_app/domain/dto/EmptyData.dart';

class EmptyWidget extends StatelessWidget {
  static const double _TITLE_FONT_SIZE = 16.0;
  static const double _SUB_TITLE_FONT_SIZE = 12.0;
  static const double _BUTTON_FONT_SIZE = 14.0;

  final TextStyle _titleStyle = const TextStyle(
    color: Colors.black,
    fontSize: _TITLE_FONT_SIZE,
  );
  final TextStyle _subTitleStyle = const TextStyle(
    color: Colors.black,
    fontSize: _SUB_TITLE_FONT_SIZE,
  );
  final TextStyle _buttonStyle = const TextStyle(
    color: Colors.black,
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
            style: _titleStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            _emptyData.description,
            style: _subTitleStyle,
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text(
              AppLocalizations.of(context).getString("empty_state_retry"),
              style: _buttonStyle,
            ),
            onPressed: _onReload,
          )
        ],
      ),
    );
  }
}
