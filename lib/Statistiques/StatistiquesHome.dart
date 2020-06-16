import 'package:bluetrack/sidebar/navigation_bloc.dart';
import 'package:flutter/material.dart';
import './Widgets/PreventionCard.dart';
import './Widgets/CaseCard.dart';
import '../Animation/FadeAnimation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Widgets/MostAffectedCountries.dart';
import './Widgets/CountryPage.dart';

class StatistiquesHome extends StatefulWidget with NavigationStates  {
  @override
  _StatistiquesHomeState createState() => _StatistiquesHomeState();
}

class _StatistiquesHomeState extends State<StatistiquesHome> {
  Color mainColor = Color(0xff0F8B8D);

  List countryData;
  fetchCountryDataSorted() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  List countryDataN;
  fetchCountryData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryDataN = json.decode(response.body);
    });
  }
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  @override
  void initState(){
    fetchWorldWideData();
    fetchCountryDataSorted();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Padding(
                        padding: const EdgeInsets.only(top:12.0,left: 20),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Maroc ",
                              style: Theme.of(context).textTheme.title.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.network(
                              "https://disease.sh/assets/img/flags/ma.png",
                              height: 25,
                            ),
                          ],
                        ),

                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CountryPage()));
                      },
                      child: FadeAnimation(
                          1,
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(
                              left: 100,
                            ),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "Autres pays",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              FadeAnimation(
                1.3,
                Container(
                  //container dial l cases for Morocco
                  padding: EdgeInsets.only(left: 50, top: 10, right: 20, bottom: 10),
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: mainColor.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )),
                  child: Wrap(
                    //children of the main container
                    children: <Widget>[
                      InfoCard(
                        title: "Cas confirmés",
                        iconColor: Color(0xFFFF9C00),
                        affectedNum: countryDataN==null ? 0:countryDataN[136]['cases'],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InfoCard(
                          title: "Morts",
                          iconColor: Color(0xFFFF2D55),
                          affectedNum: countryDataN==null ? 0:countryDataN[136]['deaths'],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InfoCard(
                          title: "Cas guéris",
                          iconColor: Color(0xFF50E3C2),
                          affectedNum: countryDataN==null ? 0:countryDataN[136]['recovered'],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: InfoCard(
                          title: "Nouveaux cas",
                          iconColor: Color(0xFF5856D6),
                          affectedNum: countryDataN==null ? 0:countryDataN[136]['todayCases'],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      1.5,
                      Text(
                        "Préventions",
                        style: Theme.of(context).textTheme.title.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.9,
                      Row(
                        //for the prevention pictures
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          PreventionCard(
                              svgSrc: "images/hand_wash.svg",
                              title: "Se laver"),
                          PreventionCard(
                              svgSrc: "images/use_mask.svg",
                              title: "Utiliser un masque"),
                          PreventionCard(
                              svgSrc: "images/Clean_Disinfect.svg",
                              title: "Désinfecter"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      2.1,
                      Text(
                        "Pays les plus affectés",
                        style: Theme.of(context).textTheme.title.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    FadeAnimation(2.1,
                      countryData == null
                          ? Container()
                          : MostAffected(
                        countryData: countryData,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }


}


