import 'package:flutter/material.dart';

class WelcomeBloc extends ChangeNotifier {
  PageController _controller = PageController();
  int _currentPage;
  bool _lastPage = false;

  bool get lastPage => _lastPage;

  set lastPage(bool value) {
    _lastPage = value;
    notifyListeners();
  }

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  get controller => _controller;

  nextPage(Duration duration, Curves curve) {
    controller.nextPage(duration: duration, curve: curve);
  }
}
