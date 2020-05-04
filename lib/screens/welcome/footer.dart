import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/screens/welcome/welcome_bloc.dart';
import 'package:flutter/scheduler.dart';

class Footer extends StatefulWidget {
  final int currentStep;
  final int totalSteps;
  final Color activeColor;
  final Color inactiveColor;
  final Duration duration;
  final Function onFinal;
  final Function onStart;

  Footer({
    this.activeColor,
    this.inactiveColor,
    this.currentStep,
    this.totalSteps,
    this.duration,
    this.onFinal,
    this.onStart,
  }) {}

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final double radius = 10.0;
  final double distance = 4.0;
  Container stepper;
  Container nextArrow;
  bool lastPage;
  WelcomeBloc _welcomeBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SchedulerBinding.instance
    //     .addPostFrameCallback((_) => this._detectLastPage());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final WelcomeBloc _welcome = Provider.of<WelcomeBloc>(context);
    _welcomeBloc = _welcome;
    // this._detectLastPage();
  }

  @override
  Widget build(BuildContext context) {
    this._makeStepper();
    this._makeNextArrow();

    // Future<void> executeAfterBuild() async {
    //   // this code will get executed after the build method
    //   // because of the way async functions are scheduled

    //   try {
    //     await this._detectLastPage();
    //   } catch (e) {
    //     print('error happened');
    //   }
    // }

    // executeAfterBuild();

    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          this.stepper,
          this.nextArrow,
        ],
      ),
    );
  }

  _makeCirle(activeColor, inactiveColor, position, currentStep) {
    currentStep = currentStep == null ? 0 : currentStep - 1;
    Color color = (position == currentStep) ? activeColor : inactiveColor;

    return Container(
      height: this.radius,
      width: this.radius,
      margin: EdgeInsets.only(left: this.distance, right: this.distance),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: activeColor, width: 2.0),
          borderRadius: BorderRadius.circular(50.0)),
    );
  }

  _makeStepper() {
    List<Container> circles = List();

    for (var i = 0; i < widget.totalSteps; i++) {
      circles.add(
        _makeCirle(this.widget.activeColor, this.widget.inactiveColor, i,
            this.widget.currentStep),
      );
    }

    this.stepper = Container(
      child: Row(
        children: circles,
      ),
    );
  }

  _makeNextArrow() {
    this.nextArrow = Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: GestureDetector(
            onTap: () {
              _welcomeBloc.controller.nextPage(
                duration: this.widget.duration ?? Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Icon(
              Icons.arrow_forward,
            )),
      ),
    );
  }

  _onLastPage() {
    if (this.widget.onFinal != null) {
      this.widget.onFinal();
    }
  }

  _onFirstPage() {
    if (this.widget.onStart != null) {
      this.widget.onStart();
    }
  }

  _detectLastPage() {
    // Here I've got inaccurate data

    print(this.widget.currentStep);

    int currentPage =
        this.widget.currentStep == null ? 1 : this.widget.currentStep;

    if (currentPage == 1 && this.widget.currentStep == null) {
      this._onFirstPage();
    } else if (currentPage == this.widget.totalSteps) {
      print('lastPage detected');
      // setState(() {
      this.lastPage = true;
      // });
        _welcomeBloc.lastPage = true;
      this._onLastPage();
    } else {
      // setState(() {
        _welcomeBloc.lastPage = false;
      // });
      // _welcomeBloc.lastPage = false;
    }
  }
}
