import 'package:ui_flutter/model/app_state.dart';
import 'package:ui_flutter/redux/actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is CurrentPageAction) {
    // print('updating currentPage');
    newState.currentPage = action.currentPage;
  }

  if (action is LastPageAction) {
    newState.lastPage = action.lastPage;
  }

  // if (action is LastPageAction) {
  //   newState.lastPage = action.lastPage;
  // }

  return newState;
}
