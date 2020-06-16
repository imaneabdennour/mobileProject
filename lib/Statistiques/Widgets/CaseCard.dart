import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './Chart.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int affectedNum;
  final Color iconColor;
  const InfoCard({
    Key key,
    this.title,
    this.affectedNum,
    this.iconColor,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(  //container dial cas confirmés
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(  //elements placés ds la même ligne
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "images/running.svg",
                    width: 20,
                    height: 20,
                    color: iconColor,
                  ),
                ),
                SizedBox(width: 5,),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.blue),
                        children: [
                          TextSpan(
                              text: "$affectedNum\n",    //nbr
                              style: Theme.of(context).textTheme.title.copyWith(
                                fontWeight: FontWeight.bold,                        )
                          ),
                          TextSpan(
                              text:"Personnes",
                              style: TextStyle(
                                fontSize: 12,
                                height: 2,
                              )
                          )
                        ]
                    ),
                  ),
                ),
                Expanded( //chart
                  child:LineReportChart(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

