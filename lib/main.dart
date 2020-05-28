import 'package:bluetrack/utilities/userInfo.dart';
import 'package:flutter/material.dart';

import 'LogIn.dart';

import './AboutApp.dart';
import 'loader.dart';

import './SignUp.dart';
import 'StartQuiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: OnboardingScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getVisitingFlag(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SignUp();  //test page SignUp
          }

  _myBuilderFunction(dynamic flag) {
    if (flag)
      return Login();
    else
      return OnboardingScreen();
  }
}
  }
}
