import 'package:flutter/material.dart';
import 'package:bluetrack/sidebar/navigation_bloc.dart';


class Home extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Accueilss",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}