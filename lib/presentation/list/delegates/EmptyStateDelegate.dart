import 'package:flutter/material.dart';
import 'package:news_app/app/AppLocalizations.dart';
import 'package:news_app/domain/actions/DomainAction.dart';
import 'package:news_app/domain/actions/ErrorAction.dart';
import 'package:news_app/domain/actions/LoadedAction.dart';
import 'package:news_app/domain/dto/EmptyData.dart';

class EmptyStateDelegate {
  final BuildContext _context;

  EmptyStateDelegate(this._context);

  EmptyData reduce(DomainAction action) {
    if (action is LoadedAction) {
      if (action.items.isEmpty) {
        return EmptyData.show(AppLocalizations.of(_context).getString("empty_state_title"),
            AppLocalizations.of(_context).getString("empty_state_description"));
      } else {
        return EmptyData.hide();
      }
    } else if (action is ErrorAction) {
      return EmptyData.hide();
    }
    return null;
  }
}
