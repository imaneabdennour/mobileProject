import 'package:bluetrack/utilities/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './utilities/styles.dart';
import 'LogIn.dart';
import 'SignUp.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 7;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      //height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff0F8B8D) : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        //child: Container(
        /* decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),*/
        child: Container(
          // decoration: new BoxDecoration(color: Colors.green),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                /*Container(
                    //alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () => print('Skip'),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),*/
                Container(
                  height: 683.3,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/world3.jpg"),
                                fit: BoxFit.cover)),
                        //decoration: new BoxDecoration(color: Colors.green),
                        //decoration: new BoxDecoration(color: Color(0xff0F8B8D)),
                        child: Padding(
                          //padding: EdgeInsets.only(bottom: 10),
                          padding:
                              EdgeInsets.only(top: 460, left: 20, right: 13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              /* Image(
                                    image: AssetImage(
                                      'assets/images/world3.jpg',
                                    ),
                                    height: 450.0,
                                    width: 600.0,
                                  ),*/

                              SizedBox(height: 3.0),
                              Center(
                                child: Text(
                                  'COVID-19',
                                  style: TextStyle(
                                    color: Color(0xff0F8B8D),
                                    fontFamily: 'CM Sans Serif',
                                    fontSize: 26.0,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Center(
                                child: Text(
                                  'Aider à freiner la propagation de la COVID-19 en evaluant votre état de santé et contribuer à la future solution En utilisant NomApp, vous serez contacté, conseillé et suivi par la Santé publique.',
                                  style: TextStyle(
                                    color: Color(0xff0F8B8D),
                                    fontFamily: 'CM Sans Serif',
                                    fontSize: 20.0,
                                    //fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _buildPageIndicator(),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: FractionalOffset.bottomRight,
                                  child: FlatButton(
                                    onPressed: () {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(width: 10.0),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xff0F8B8D),
                                          size: 30.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: new BoxDecoration(color: Color(0xff143642)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              //child: Center(child: Text('test'),),
                              //height: 190.0,
                              //width: MediaQuery.of(context).size.width - 100.0,
                              height: 425,

                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/gps.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'TRAQUER GPS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 26.0,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 13),
                              child: Text(
                                'NomApp necessite l’utilisation de vos données de localisation afin de tracer votre historique de contact avec des cas risquant d’être contaminés et surveiller la propagation du virus.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Baloo_2',
                                  //fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicator(),
                            ),
                            Expanded(
                              child: Align(
                                alignment: FractionalOffset.bottomRight,
                                child: FlatButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 10.0),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: new BoxDecoration(color: Color(0xffA8201A)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 425,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/test.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'NOTIFICATIONS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 26.0,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 13),
                              child: Text(
                                'NomApp vous alerte de la présence des personnes infectées dans votre région tout en respectant la protection des données personnelles. ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Baloo_2',
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicator(),
                            ),
                            Expanded(
                              child: Align(
                                alignment: FractionalOffset.bottomRight,
                                child: FlatButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 10.0),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: new BoxDecoration(color: Color(0xff0F8B8D)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 425,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/notifs.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'COVID-19 TEST',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 26.0,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 13),
                              child: Text(
                                'NomApp vous permet l’auto-diagnostic des symptômes du COVID-19 à travers un questionnaire.',
                                style: TextStyle(
                                  // color: Color (0xff143642),
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Baloo_2',
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicator(),
                            ),
                            Expanded(
                              child: Align(
                                alignment: FractionalOffset.bottomRight,
                                child: FlatButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 10.0),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: new BoxDecoration(color: Color(0xffDAD2D8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 425,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/conseil.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'CONSEILS',
                                style: TextStyle(
                                  color: Color(0xff0F8B8D),
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 26.0,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 13),
                              child: Text(
                                'Réduire les risques de contamination à la COVID-19 en suivant des conseils à propos des mesures de prévention contre le coronavirus.',
                                style: TextStyle(
                                  color: Color(0xff0F8B8D),
                                  fontSize: 20.0,
                                  fontFamily: 'Baloo_2',
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicator(),
                            ),
                            Expanded(
                              child: Align(
                                alignment: FractionalOffset.bottomRight,
                                child: FlatButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 10.0),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xff0F8B8D),
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: new BoxDecoration(color: Color(0xffEC9A29)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 425,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/statics.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'STATISTIQUES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 26.0,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 13),
                              child: Text(
                                'Des statistiques permettant d’identifier les foyers épidémiques et les zones risquées seront mis à votre disposition afin de suivre la situation sanitaire de la ville.',
                                style: TextStyle(
                                  //color: Color (0xff0F8B8D),
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Baloo_2',
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicator(),
                            ),
                            Expanded(
                              child: Align(
                                alignment: FractionalOffset.bottomRight,
                                child: FlatButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 10.0),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: new BoxDecoration(color: Color(0xffA8201A)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 225,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/map.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'COVID-19 MONDE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 26.0,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 13),
                              child: Text(
                                'Suivez la propagation du COVID-19 à travers le monde. Des chiffres seront mis à jour quotidiennement selon l’évolution de l’épidémie.',
                                style: TextStyle(
                                  //color: Color (0xff020E1A),
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Baloo_2',
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            // SizedBox(height: 40.0),
                            //SizedBox(height: 20.0),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                  height: 40.0,
                                  width: 200,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                            width: 1.0),
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: GestureDetector(
                                        onTap: () {
                                           setVisitingFlag();
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                                           //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                                          Navigator.pop(context);
                                          Navigator.push(
                                           context,
                                           MaterialPageRoute(
                                           builder: (context) => Login()));
                                        },


                                        child: Center(
                                          child: Text('Commencer',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat')),
                                        ),
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //),
      ),
    );
  }
}
