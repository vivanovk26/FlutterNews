import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/AppLocalizations.dart';
import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/ErrorAction.dart';
import 'package:news_app/domain/dto/LoadingType.dart';

class SnackBarDelegate {
  void reduce(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, DomainAction action) {
    if (action is ErrorAction && action.loadingType == LoadingType.Refresh) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context).getString("error_update"),
          ),
        ),
      );
    }
  }
}
