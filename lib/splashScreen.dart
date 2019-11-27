import 'package:flutter/material.dart';

import 'loginScreen.dart';

void main() => runApp(SplashScreen());

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primarySwatch: MaterialColor(0xFFA84F91, color)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  scale: 0.8,
                ),
                new ProgressIndicator(),
              ]),
        ),
      ),
    );
  }
}

class ProgressIndicator extends StatefulWidget {
  @override
  _ProgressIndicatorState createState() => new _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if (animation.value > 0.99) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
          }
        });
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        child: CircularProgressIndicator(
          value: animation.value,
          backgroundColor: Colors.black,
          valueColor: new AlwaysStoppedAnimation<Color>(
              Color.fromRGBO(168, 79, 145, 1)),
        ),
      ),
    );
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(168, 79, 145, .1),
  100: Color.fromRGBO(168, 79, 145, .2),
  200: Color.fromRGBO(168, 79, 145, .3),
  300: Color.fromRGBO(168, 79, 145, .4),
  400: Color.fromRGBO(168, 79, 145, .5),
  500: Color.fromRGBO(168, 79, 145, .6),
  600: Color.fromRGBO(168, 79, 145, .7),
  700: Color.fromRGBO(168, 79, 145, .8),
  800: Color.fromRGBO(168, 79, 145, .9),
  900: Color.fromRGBO(168, 79, 145, 1),
};
