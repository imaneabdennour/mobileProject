
import 'package:flutter/material.dart';
import 'package:bluetrack/sidebar/navigation_bloc.dart';

import 'adresse.dart';

class Maladie extends StatefulWidget with NavigationStates{
  @override
 _MaladieWidgetState createState() => _MaladieWidgetState();
}

class _MaladieWidgetState extends State<Maladie> {
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
                   Container( 
                 
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/covid.png'),
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
                          "Vueillez cliquer sur le button ci-dessous si votre test de covid-19 est positive,\n à fin de notifier les personnes que vous avez rencontré durant les 5 jours précédent,\n sans leur montrez votre identité, pour qu'ils soient plus prudent et faire aussi le test pour s'assurer\n s'ils ne sont malade eux aussi. ",
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Adresse()));
                          },

                          color:Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color:Colors.transparent,)),

                          child: Text("Malade", style:TextStyle(
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



