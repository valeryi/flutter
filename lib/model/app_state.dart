import 'package:flutter/material.dart';


class AppState {
bool lastPage;
int currentPage;
PageController _controller = PageController();

AppState({this.lastPage, this.currentPage});

AppState.fromAppState(AppState another) {
  lastPage = another.lastPage;
  currentPage = another.currentPage;
}
  
  PageController get pageController => _controller;

}