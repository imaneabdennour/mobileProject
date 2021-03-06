//import 'package:bluetrack/Model/User.dart';
import 'package:bluetrack/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bluetrack/Animation/FadeAnimation.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Color mainColor = Color(0xff0F8B8D);
 // User user = new User();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height/2,
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: deviceHeight / 2 - 20,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: FadeAnimation(
                              1,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/signup.png'),
                                        fit: BoxFit.fill)),
                              )),
                        ),
                       /* Positioned(
                          child: FadeAnimation(
                              1.3,
                              Container(
                                //height:deviceHeight-deviceHeight/2  ,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/OUS-1.png'),
                                        fit: BoxFit.fill)),
                              )),
                        ),*/
                      ],
                    ),
                  ),
                  Container(
                    //height: deviceHeight / 2,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FadeAnimation(
                                    1.5,
                                    Text(
                                      "Sign up",
                                      style: TextStyle(
                                          color: Color.fromRGBO(49, 39, 79, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    )),
                                FadeAnimation(
                                    1.7,
                                    Container(
                                      //padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    196, 135, 198, 0.2),
                                                blurRadius: 20,
                                                offset: Offset(0, 20))
                                          ]),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey[200])),
                                            ),
                                            child: TextField(
                                              onChanged: (value) {
                                                    //traitement
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Num de téléphone",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey)),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: TextField(
                                              onChanged: (value) {
                                                //traitement
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Password",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey)),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            )),
                        Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //padding:  EdgeInsets.only(top:padding*40),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: FadeAnimation(
                                    1.7,
                                    Center(
                                        child: Text(
                                          "Vous avez déjà un compte ?",
                                          style: TextStyle(
                                              color:
                                              Color.fromRGBO(196, 135, 198, 1)),
                                        )))),

                            SizedBox(
                              height: 40,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp()));
                              },
                              child: FadeAnimation(
                                  1.9,
                                  Container(
                                    height: 50,
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius:
                                        BorderRadius.circular(50)),
                                    child: Center(
                                      child: Text(
                                        "S'inscrire",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )),
                            ),

                            SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: FadeAnimation(
                                    2,
                                    Center(
                                        child: Text(
                                          "Créer un compte ",
                                          style: TextStyle(
                                            color: Color.fromRGBO(0, 51, 102, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )))),
                            //),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}