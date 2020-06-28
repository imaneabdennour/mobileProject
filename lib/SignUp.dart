//import 'package:bluetrack/Model/User.dart';
import 'dart:math';

import 'package:bluetrack/Menu.dart';
import 'package:bluetrack/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bluetrack/Animation/FadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bluetrack/LogIn.dart';
import 'package:bluetrack/sidebar/navigation_bloc.dart';


class SignUp extends StatefulWidget  with NavigationStates{
  @override
  _SignUpState createState() => _SignUpState();
}

final FirebaseAuth mAuth = FirebaseAuth.instance;

class _SignUpState extends State<SignUp> {
  Color mainColor = Color(0xff0F8B8D);
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
                                              controller: emailController,
                                              onChanged: (value) {
                                                    //traitement
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Email",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey)),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: TextField(
                                              controller: passwordController,
                                             /* onChanged: (value) {
                                                //traitement
                                              },*/
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
                                signUpWithEmailPssword();
                                 Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                 builder: (context) => Login()));
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
                            /*RaisedButton(
                              child: Text("S'inscrire"),
                              onPressed: ),*/

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
  Future<void> signUpWithEmailPssword()
  async {
   /* if(_formKey.currentState.validate()){
  _formKey.currentState.save();*/
   
    //FirebaseUser result;
    try{
    AuthResult result = await mAuth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      FirebaseUser user = result.user;
      final FirebaseUser auth = await mAuth.currentUser();
      final uid = auth.uid;
      var personneRencontree = [{'id': 'szrjihZ1BHPmWLVUB8fT7silrKp2'}, {'id': 'B8wHSywxrYhOec4M3dcnCFozJhp2'}, {'id': 'zszvRS6h8ZbWRA5QnUKfFwAxU9G2'}];
     /* var localisation = new Map();
         localisation['longitude'] = '12'; 
         localisation['latitude'] = '15'; 
         localisation['latitude'] = '06-21-2020'; */
         List<Map<String, String>> localisation = [
  {'longitude': '12', 'latitude': '15','time':'06-28-2020'},
  {'longitude': '42', 'latitude': '105','time':'06-27-2020'},
  {'longitude': '20', 'latitude': '13', 'time':'06-21-2020'/*DateTime.now()*/},
];


      //Map<String, dynamic> myObject = {'latitude': widget.lat} ;
     // await Firestore.instance.collection('users').document().setData({ 'Etat': false});
      await Firestore.instance.collection('users').document(uid).setData({'id':uid,'Etat': false,"personneRencontree": FieldValue.arrayUnion(personneRencontree),"localisation": FieldValue.arrayUnion(localisation), "adress":""});
      /*final DocumentReference documentReference=await Firestore.instance.collection('users').add({'id':"",'Etat': "","personneRencontree": "","localisation": ""});
      final String id = documentReference.documentID;*/
      //await Firestore.instance.collection('users').document().updateData({'id':id,});


      //firestore.instance.collection("collectionName").document("documentID").setData({field : value }, merge: true
      //Firestore.instance.collection('users').document(id).setData({'id': id,'Etat': false,"personneRencontree": FieldValue.arrayUnion(personneRencontree),"localisation": FieldValue.arrayUnion(localisation)});
     // await Firestore.instance.collection('users').document().setData({"localisation": FieldValue.arrayUnion(localisation)});

   /* var ref = Firestore.instance.document('collection/document');
ref.setData(
  {
    'localisation': localisation,
  }
);*/

      //var list = List<String>();
      //list.add(personneRencontree);
     
    }catch(e)
    {
      print(e.toString());
    }
     }
}