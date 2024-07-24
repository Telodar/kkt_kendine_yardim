import 'package:flutter/material.dart';
import 'package:test3/home_page.dart';

class PageControllerProvider with ChangeNotifier {
  Widget _currentPage = const HomePage();

  Widget get currentPage => _currentPage;

  void changePage(Widget newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}