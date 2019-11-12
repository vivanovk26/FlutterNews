import 'package:flutter/material.dart';
import 'package:news_app/app/AppLocalizations.dart';
import 'package:news_app/presentation/list/articles/ArticlesListScreen.dart';
import 'package:news_app/presentation/main/MainState.dart';

class MainScreen extends StatefulWidget {
  // Indexes
  static const _ARTICLES_PAGE_INDEX = 0;
  static const _BOOKMARKS_PAGE_INDEX = 1;

  // Text
  static const double _NAVIGATION_TITLE_FONT_SIZE = 12.0;

  // Styles
  static const Color _SELECTED_COLOR = Colors.green;
  static const TextStyle _BOTTOM_NAVIGATION_TITLE_STYLE = TextStyle(
    color: _SELECTED_COLOR,
    fontSize: _NAVIGATION_TITLE_FONT_SIZE,
  );

  @override
  MainState createState() => MainState();

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context).getString("app_name"),
      ),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case _ARTICLES_PAGE_INDEX:
        return _buildArticlesScreen();
      case _BOOKMARKS_PAGE_INDEX:
        return _buildBookmarksScreen();
      default:
        return _buildArticlesScreen();
    }
  }

  Widget _buildArticlesScreen() => ArticlesListScreen();

  Widget _buildBookmarksScreen() => Center(
        child: Text("Whooa"),
      );

  Widget buildBottomNavigationBar(BuildContext context, int currentIndex, void Function(int index) onTap) {
    return BottomNavigationBar(
      items: [
        _buildBottomNavigationBarItem(Icons.home, AppLocalizations.of(context).getString("main_articles")),
        _buildBottomNavigationBarItem(Icons.bookmark, AppLocalizations.of(context).getString("main_bookmarks"))
      ],
      currentIndex: currentIndex,
      selectedItemColor: _SELECTED_COLOR,
      onTap: onTap,
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(
        title,
        style: _BOTTOM_NAVIGATION_TITLE_STYLE,
      ),
    );
  }
}
