import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class WelcomeBloc {
  final _controller = PublishSubject<PageController>();
  final _page = PublishSubject<int>();
  final _lastPage = PublishSubject<bool>();

  Stream<PageController> get getController => _controller.stream;
  Stream<int> get currentPage => _page.stream;
  Stream<bool> get isLastPage => _lastPage.stream;

  WelcomeBloc() {
    print('started');
    // getController.listen((value){});
    // currentPage.listen((value){});
    // isLastPage.listen((value){});

    combined.doOnCancel(() {
      print('Calcelled');
    });
  }

  initialState(){
    _page.sink.add(1);
    // _controller.sink.add(PageController());
    _lastPage.sink.add(false);
  }

  Stream<List> get combined =>
      Rx.combineLatest([currentPage, isLastPage], (value) {
        print('Streams: $value');
        return value;
      });

  updatePage(int page) {
    _page.sink.add(page);
  }

  updatePageState(bool state) {
    _lastPage.sink.add(state);
  }

  dispose() {
    _controller.close();
    _page.close();
    _lastPage.close();
  }
}

final welcomeBloc = WelcomeBloc();
