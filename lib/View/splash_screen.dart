import 'dart:async';

import 'package:covid_tracker/View/World_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// TickerProviderStateMixin helps with making animation
class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // making an animation controller to control animation later use in animation
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    //this is code for splash screen
    Timer(Duration(seconds: 1), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => World_states(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  //MediaQuery.of(context).size.height mean any screen total size height so that it remain dynamic
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Center(
                    child: Image(image: AssetImage('images/virus.png')),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Covid 19\nTracker App',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
