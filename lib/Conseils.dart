
import 'package:flutter/material.dart';
import 'package:bluetrack/sidebar/navigation_bloc.dart';




class Conseils extends StatefulWidget with NavigationStates{
  @override
 _ConseilsWidgetState createState() => _ConseilsWidgetState();
}


ThemeData appTheme = ThemeData(
  fontFamily: 'Oxygen',
  primaryColor: Colors.purpleAccent,
);

class  _ConseilsWidgetState extends State<Conseils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          CurvedListItem(
            title: 'Respectez au maximum les mesures de distanciation sociales',
            color: Color(0xff143642),
            nextColor: Color(0xff0F8B8D),
          ),
          CurvedListItem(
            title: 'Lavez-vous très régulièrement les mains',
            color: Color(0xff0F8B8D),
            nextColor: Color(0xff143642),
          ),
          CurvedListItem(
            title: 'Toussez ou éternuez dans votre coude ou dans un mouchoir',
            color: Color(0xff143642),
            nextColor: Color(0xff0F8B8D),
          ),
           CurvedListItem(
            title: "Saluez sans serrer la main, n'embrassez personne",
            color: Color(0xff0F8B8D),
             nextColor: Color(0xff143642),
          ),
           CurvedListItem(
            title: 'Utilisez un mouchoir à usage unique et jetez-le',
            color: Color(0xff143642),
             nextColor: Color(0xff0F8B8D),
          ),
           CurvedListItem(
            title: 'Restez chez vous autant que possible',
            color: Color(0xff0F8B8D),
             nextColor: Color(0xff143642),
          ),
           CurvedListItem(
            title: 'Ne touchez pas votre visage',
            color: Color(0xff143642),
             nextColor: Color(0xff0F8B8D),
          ),
           CurvedListItem(
            title: 'Respectez les indications des autorités sanitaires ‎locales',
            color: Color(0xff0F8B8D),
             nextColor: Color(0xff143642),
          ),
           CurvedListItem(
            title: 'Limitez les interactions sociales',
            color:Color(0xff143642) ,
             nextColor: Color(0xff0F8B8D),
          ),
           CurvedListItem(
            title: 'Portez un masque',
            color: Color(0xff0F8B8D),
             nextColor: Color(0xff143642),
          ),
        ],
      ),
    );
  }
}

class CurvedListItem extends StatelessWidget {
  const CurvedListItem({
    this.title,
    this.icon,
    this.people,
    this.color,
    this.nextColor,
  });

  final String title;
  final String people;
  final IconData icon;
  final Color color;
  final Color nextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          top: 30.0,
          bottom: 50,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 2,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Row(),
            ]),
      ),
    );
  }
}