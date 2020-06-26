// import 'dart:async';

// import 'package:bluetrack/sidebar/navigation_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/services.dart';

// import 'Animation/FadeAnimation.dart';


// class Code extends StatefulWidget with NavigationStates{
//   @override
//   CodePage createState() {
//     return new CodePage();
//   }
// }

// class Form extends StatelessWidget {
//   String result;

//   Form(String result){
//     this.result=result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFFe9ecef),
//         body: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 250,
//                   child: Stack(
//                     children: <Widget>[
//                       Positioned(
//                         child: FadeAnimation(1.6, Container(
//                           margin: EdgeInsets.only(top: 80),
//                           child: Center(
//                             child: Text("  Veuillez écrire ou \nscannez le code QR", style: TextStyle(color: Color(0xFC577590), fontSize: 30, fontWeight: FontWeight.bold),),
//                           ),
//                         )),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(30.0),
//                   child: Column(
//                     children: <Widget>[
//                       FadeAnimation(1.8, Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Color.fromRGBO(143, 148, 251, .2),
//                                   blurRadius: 20.0,
//                                   offset: Offset(0, 10)
//                               )
//                             ]
//                         ),
//                         child: Column(
//                           children: <Widget>[
//                             Container(
//                               padding: EdgeInsets.all(8.0),

//                               child: TextField(
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: result,
//                                     hintStyle: TextStyle(color: Colors.grey[400])
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )),
//                       SizedBox(height: 30,),
//                       FadeAnimation(2, Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             gradient: LinearGradient(
//                                 colors: [
//                                   Color.fromRGBO(143, 148, 251, 1),
//                                   Color.fromRGBO(143, 148, 251, .6),
//                                 ]
//                             )
//                         ),
//                         child: Center(
//                           child: Text("Valider", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
//                         ),
//                       )),
//                       SizedBox(height: 70,),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }

// class CodePage extends State<Code> {
//   String result = "Code de vérification";

//   Future _scanQR() async {
//     try {
//       String qrResult = await BarcodeScanner.scan();
//       setState(() {
//         result = qrResult;
//       });
//     } on PlatformException catch (ex) {
//       if (ex.code == BarcodeScanner.CameraAccessDenied) {
//         setState(() {
//           result = "La permission du camera a été refusé";
//         });
//       } else {
//         setState(() {
//           result = "Erreur inconnu $ex";
//         });
//       }
//     } on FormatException {
//       setState(() {
//         result = "Vous avez pressé le boutton de retour avant de scanner";
//       });
//     } catch (ex) {
//       setState(() {
//         result = "Erreur inconnu $ex";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(child: Form(result)),
//       floatingActionButton: FloatingActionButton.extended(
//         icon: Icon(Icons.camera_alt),
//         label: Text("Scan"),
//         onPressed: _scanQR,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }



