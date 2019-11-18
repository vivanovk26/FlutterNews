import 'package:flutter/material.dart';
import 'package:news_app/app/AppLocalizations.dart';
import 'package:news_app/presentation/screens/articles/ArticlesListScreen.dart';
import 'package:news_app/presentation/screens/bookmarks/BookmarksListScreen.dart';

import 'MainState.dart';

class MainScreen extends StatefulWidget {
  // Indexes & keys
  static const String _ARTICLES_PAGE_KEY = "ARTICLES_PAGE_KEY";
  static const String _BOOKMARKS_PAGE_KEY = "BOOKMARKS_PAGE_KEY";

  // Text
  static const double _NAVIGATION_TITLE_FONT_SIZE = 12.0;

  // Styles
  static const Color _SELECTED_COLOR = Colors.green;
  static const TextStyle _BOTTOM_NAVIGATION_TITLE_STYLE = TextStyle(
    color: _SELECTED_COLOR,
    fontSize: _NAVIGATION_TITLE_FONT_SIZE,
  );

  // Fields
  final List<Widget> pages = [
    ArticlesListScreen(PageStorageKey(_ARTICLES_PAGE_KEY)),
    BookmarksListScreen(PageStorageKey(_BOOKMARKS_PAGE_KEY)),
  ];
  final PageStorageBucket pagesBucket = PageStorageBucket();

  @override
  MainState createState() => MainState();

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context).getString("app_name"),
      ),
    );
  }

  Widget buildPages(int index) {
    return PageStorage(
      child: pages[index],
      bucket: pagesBucket,
    );
  }

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
