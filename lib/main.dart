import 'package:bluetrack/services/AlertNotificationService.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState(); 
    //**************************************add it l login*********************************
    AlertNotificationService().init();
  }
  @override
  Widget build(BuildContext context) {
    /*return FutureBuilder<dynamic>(
        future: getVisitingFlag(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {

            return _myBuilderFunction(snapshot.data);
          } else {
            return ColorLoader3();
          }
        });*/
    //for test comment the  previous code and use this code
    return Scaffold(
      body: SignUp()
    );


  }

  _myBuilderFunction(dynamic flag) {
    if (flag)
      return Login();
    else
      return OnboardingScreen();
  }
}

