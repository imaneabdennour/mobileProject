import 'package:flutter/material.dart';
import './Quiz.dart';
import './StartQuiz.dart';
void main() {
  runApp(MaterialApp(home:MyApp() ,));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer : Drawer( //barre de menu ou on specifie les infos
        child: ListView(
          children: <Widget>[ //tab de widgets( les elements de menu 3ndna lwl howa header)
            DrawerHeader(//hia li fiha tsouira cause it s a header
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.greenAccent,Colors.teal])
              ),
              child:Center(
                child: CircleAvatar(
                  radius: 40,
                 // backgroundImage: AssetImage('images/abir.JPG'),
                ),
              ),
            ),
            ListTile(
              title: Text('Quiz', style: TextStyle(fontSize: 20)),
              onTap: (){
                Navigator.of(context).pop(); //pour fermer la barre menu quand on click sur quiz
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StartQuizState()));
              },
            ),
            Divider(color: Colors.greenAccent),
            ListTile(
              title: Text('Weather', style: TextStyle(fontSize: 20)),
              onTap: (){
                Navigator.of(context).pop(); //pour fermer la barre menu quand on click sur quiz
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
              },
            ),
            Divider(color: Colors.greenAccent),
            ListTile(
              title: Text('Gallery', style: TextStyle(fontSize: 20)),
              onTap: (){
                Navigator.of(context).pop(); //pour fermer la barre menu quand on click sur quiz
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
              },
            ),
            Divider(color: Colors.greenAccent), //diviseur entre l3ibat d menu
            ListTile(
              title: Text('Camera', style: TextStyle(fontSize: 20)),
              onTap: (){
                Navigator.of(context).pop(); //pour fermer la barre menu quand on click sur quiz
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(title: Text('My APP'),backgroundColor: Colors.greenAccent,),
      body: Center(child: Text('Hello II', style: TextStyle(fontSize: 22, color: Colors.teal ) ,)),


    );
  }
}

/*import 'package:flutter/material.dart';

import './AboutApp.dart';

import './SignUp.dart';

import './Quiz.dart';
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

    return SignUp();  //test page SignUp
  }
}
*/