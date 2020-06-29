import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './utilities/styles.dart';
import './Quiz.dart';
import 'package:bluetrack/sidebar/navigation_bloc.dart';

import 'Animation/FadeAnimation.dart';


class StartQuizState extends StatefulWidget with NavigationStates{
  @override
  _StartQuizStateState createState() => _StartQuizStateState();
}

class _StartQuizStateState extends State<StartQuizState> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
     // appBar: AppBar(backgroundColor: Colors.greenAccent,),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors:  [Color(0xff143642), Color(0xff0F8B8D)])),
        child: Center(
          child: Center(


              child: Column(//cause 3ndna text et button i guess
                //mainAxisAlignment: MainAxisAlignment.center,//bash tweli lwest cause Center li lfo9 makhdmatsh dont know why
                children: <Widget>[
                 SizedBox(
                    width:80,
                    height: 45,
                    //height: deviceHeight / 4 - 20,

                  ),
                   Container( 
                   width:140,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/test.png'),
                          //fit: BoxFit.fill
                        )
                    ),),

                  /*SizedBox(
                    width:80,
                    height: 30,

                  ),*/

                  Padding(
                    padding: const EdgeInsets.only(left:30.0, right: 30, top:50),

                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color:  Colors.white, width: 2),
                        ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "La recommandation affichée peut évoluer suivant les informations en provenance des autorités de santé et des chercheurs. Elle ne constitue pas un avis médical. En cas de doute, demandez conseil à votre médecin ou pharmacien.",
                          style: TextStyle(fontSize: 15, color: Colors.white /*fontWeight: FontWeight.bold*/),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:80,
                    height: 20,

                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonTheme(//nbdl size d button
                        minWidth: 320.0,
                        height: deviceHeight/4 -50,//50.0,
                        child: FlatButton(

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
                          },

                          /*color:Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color:Colors.transparent,)),

                          child: Text("Demarrez le test", style:TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold),),
                          textColor: Colors.white,*/

                          child: FadeAnimation(
                                  1.9,
                                  Container(
                                    height: 50,
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(50)),
                                    child: Center(
                                      child: Text(
                                        "Demarrez le test",
                                        style: TextStyle(color:  Color(0xff0F8B8D)),
                                      ),
                                    ),
                                  )),

                        )),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
