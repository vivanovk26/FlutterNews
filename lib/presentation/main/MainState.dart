import 'package:flutter/material.dart';
import 'package:news_app/presentation/list/delegates/SnackBarDelegate.dart';
import 'package:news_app/presentation/main/MainScreen.dart';

class MainState extends State<MainScreen> {
  // Keys
  // I suppose this is the only way to handle SnackBar events outside Scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // Delegates
  final SnackBarDelegate _snackBarDelegate = SnackBarDelegate();

  // Fields
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: widget.buildAppBar(context),
        body: widget.getPage(_selectedPageIndex),
        bottomNavigationBar: widget.buildBottomNavigationBar(
          context,
          _selectedPageIndex,
          _onBottomNavigationItemClicked,
        ));
  }

  void _onBottomNavigationItemClicked(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
