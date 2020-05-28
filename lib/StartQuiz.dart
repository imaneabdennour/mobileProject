import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './utilities/styles.dart';
import './Quiz.dart';


class StartQuizState extends StatefulWidget {
  @override
  _StartQuizStateState createState() => _StartQuizStateState();
}

class _StartQuizStateState extends State<StartQuizState> {
  @override
  Widget build(BuildContext context) {
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
                    height: 50,

                  ),
                  DrawerHeader(//hia li fiha tsouira cause it s a header

                    child:Center(
                      child: CircleAvatar(

                        radius: 90,
                        backgroundImage: AssetImage('images/test.png'),
                      ),
                    ),
                  ),

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
                          "La recommandation affichée peut évoluer suivant les informations en provenance des autorités de santé et des chercheurs. \nElle ne constitue pas un avis médical. \nEn cas de doute, demandez conseil à votre médecin ou pharmacien.",
                          style: TextStyle(fontSize: 22, color: Colors.white /*fontWeight: FontWeight.bold*/),
                          textAlign : TextAlign.justify,
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
                        height: 50.0,
                        child: RaisedButton(

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
                          },

                          color:Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color:Colors.transparent,)),

                          child: Text("Demarrez le test", style:TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold),),
                          textColor: Colors.white,

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
