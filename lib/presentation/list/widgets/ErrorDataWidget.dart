import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/AppLocalizations.dart';
import 'package:news_app/domain/dto/ErrorData.dart';

class ErrorDataWidget extends StatelessWidget {
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

  final ErrorData _errorData;
  final Future<void> Function() _onReload;

  ErrorDataWidget(this._errorData, this._onReload);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.error),
          Text(
            AppLocalizations.of(context).getString("error_state_title"),
            style: _titleStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            _errorData.exception.toString(),
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
