
import 'package:flutter/material.dart';
import 'package:bluetrack/sidebar/navigation_bloc.dart';
import 'package:bluetrack/Animation/FadeAnimation.dart';
import 'package:bluetrack/Menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home.dart';

class Adresse extends StatefulWidget with NavigationStates{
  Color mainColor = Color(0xff0F8B8D);

  @override
 _AdresseWidgetState createState() =>  _AdresseWidgetState();
}
final FirebaseAuth mAuth = FirebaseAuth.instance;

class Rue {
  int id;
  String name;
 
  Rue(this.id, this.name);
 
  static List<Rue> getCompanies() {
    return <Rue>[
      Rue(1, 'Al Firdaous'),
      Rue(1, 'Al Massira'),
      Rue(2, 'Ancienne Medina'),
      Rue(2, 'Andalous'),
      Rue(3, 'Ayad Tounssi'),
      Rue(4, 'Bled El Jed'),
      Rue(4, 'Bordeaux'),
      Rue(1, 'Club des Pharmaciens'),
      Rue(5, 'El Houda'),
      Rue(1, 'Essalama'),
      Rue(2, 'Hassan II'),
      Rue(3, 'Ibn Khaldoun'),
      Rue(4, 'John Kennedy'),
      Rue(5, 'Lafkih El Haskouri'),
      Rue(5, 'la Renaissance'),
      Rue(3, 'Miftah El Kheir'),
      Rue(1, 'Mohamed V'),
      Rue(2, 'Moulay Abdellah'),
      Rue(4, 'Saada'),
      Rue(4, 'Safi1'),
      Rue(4, 'Safi2'),
      Rue(5, 'Zerktouni'),
      Rue(2, 'المنطقة الصناعية آسفي'),
      Rue(3, 'الحي الصناعي'),
      Rue(4, 'حي بياضة'),
      Rue(5, 'حي وريدة'),
      Rue(1, 'حي واد الباشة'),
      Rue(2, 'حي أموني'),
      Rue(3, 'حي أجنان'),
      Rue(4, 'حي عزيب الدرعي'),
    ];
  }
}

class  _AdresseWidgetState extends State<Adresse > {
  List<Rue> _companies = Rue.getCompanies();
List<DropdownMenuItem<Rue>> _dropdownMenuItems;
Rue _selectedCompany;
  @override
void initState() {
  _dropdownMenuItems = buildDropdownMenuItems(_companies);
  _selectedCompany = _dropdownMenuItems[0].value;
  super.initState();
}
 
List<DropdownMenuItem<Rue>> buildDropdownMenuItems(List companies) {
  List<DropdownMenuItem<Rue>> items = List();
  for (Rue company in companies) {
    items.add(
      DropdownMenuItem(
        value: company,
        child: Text(company.name),
      ),
    );
  }
  return items;
}

onChangeDropdownItem(Rue selectedCompany) {
  setState(() {
    _selectedCompany = selectedCompany;
  });
}
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
                colors:  [ Color(0xff143642), Color(0xff0F8B8D)])),
        child: Center(
          child: Center(


              child: Column(//cause 3ndna text et button i guess
                //mainAxisAlignment: MainAxisAlignment.center,//bash tweli lwest cause Center li lfo9 makhdmatsh dont know why
                
                children: <Widget>[
                 SizedBox(
                    //width:80,
                    height: 30,

                  ),
                  
                  

                  /*SizedBox(
                    width:80,
                    height: 30,

                  ),*/

                  Padding(
                    padding: const EdgeInsets.only(left:30.0, right: 30,/* top:50*/),

                    child: Container(
                     
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Vueillez  saisir votre adresse ",
                          style: TextStyle(fontSize: 15, color: Colors.white /*fontWeight: FontWeight.bold*/),
                         
                        ),
                      ),
                    ),
                  ),
                 /* SizedBox(
                    width:80,
                    height: 20,

                  ),*/
                  
                   DropdownButton(
                     style: TextStyle(color:  Color(0xff0F8B8D)),
                value: _selectedCompany,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
              SizedBox(
                height:380, //deviceHeight - 100,
              ),
               FlatButton(
                              onPressed: () {
                                GetAdress();
                                 Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                 builder: (context) => Menu()));
                              },
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
                                        "Confirmer",
                                        style: TextStyle(color:  Color(0xff0F8B8D)),
                                      ),
                                    ),
                                  )),
                            ),
              //Text('Selected: ${_selectedCompany.name}'),

  // navigate to the next screen.

                  /*Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonTheme(//nbdl size d button
                        minWidth: 320.0,
                        height: 50.0,
                        child: RaisedButton(

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
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
                  ),*/
                ],
              )
          ),
        ),
      ),
    );
  }
     Future<void> GetAdress()
  async {
   final FirebaseUser auth = await mAuth.currentUser();
      final uid = auth.uid;
      print(_selectedCompany.name);
      await Firestore.instance.collection('users').document(uid).updateData({'adress':_selectedCompany.name.toString(),});
      
     }
}



