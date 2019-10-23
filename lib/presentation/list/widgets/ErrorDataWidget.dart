import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/AppLocalizations.dart';
import 'package:news_app/domain/dto/ErrorData.dart';

class ErrorDataWidget extends StatelessWidget {
  static const double _TITLE_FONT_SIZE = 16.0;
  static const double _SUB_TITLE_MAX_LINES = 12.0;

  final TextStyle _titleStyle = const TextStyle(color: Colors.black, fontSize: _TITLE_FONT_SIZE);
  final TextStyle _subTitleStyle = const TextStyle(color: Colors.black, fontSize: _SUB_TITLE_MAX_LINES);

  final ErrorData _errorData;

  ErrorDataWidget(this._errorData);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Icon(Icons.error),
        Text(AppLocalizations.of(context).getString("error_state_title"),
            style: _titleStyle, textAlign: TextAlign.center),
        Text(
          _errorData.exception.toString(),
          style: _subTitleStyle,
          textAlign: TextAlign.center,
        )
      ],
    ));
  }
}
