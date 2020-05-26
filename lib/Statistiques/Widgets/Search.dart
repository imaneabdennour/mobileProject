import 'package:flutter/material.dart';
import '../../Animation/FadeAnimation.dart';
import './CaseCard.dart';

class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);


  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        primaryColor:  Color(0xff0F8B8D),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query='';

      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    Color mainColor = Color(0xff0F8B8D);
    final suggestionList
    =
    query.isEmpty?
    countryList:
    countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index)
    {
      return Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Padding(
                        padding: const EdgeInsets.only(top:1.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              suggestionList[index]['country'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                suggestionList[index]['countryInfo']['flag'],
                                height: 40,
                                width: 50,
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),

                  ],
                ),
              ),
              FadeAnimation(
                1.3,
                Container(
                  //container dial l cases
                  padding: EdgeInsets.only(left: 20, top: 10, right: 0, bottom: 10),
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: mainColor.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  child: Wrap(
                    //children of the main container
                    children: <Widget>[
                      InfoCard(
                        title: "Cas confirmés",
                        iconColor: Color(0xFFFF9C00),
                        affectedNum: suggestionList[index]['cases'],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InfoCard(
                          title: "Morts",
                          iconColor: Color(0xFFFF2D55),
                          affectedNum: suggestionList[index]['deaths'],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InfoCard(
                          title: "Cas guéris",
                          iconColor: Color(0xFF50E3C2),
                          affectedNum: suggestionList[index]['recovered'],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: InfoCard(
                          title: "Nouveaux cas",
                          iconColor: Color(0xFF5856D6),
                          affectedNum: suggestionList[index]['todayCases'],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

            ],

          ),),
      );
    },
    );

}
}