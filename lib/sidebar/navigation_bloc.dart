import 'package:bloc/bloc.dart';
import 'package:bluetrack/Conseils.dart';
import 'package:bluetrack/SignUp.dart';
import 'package:bluetrack/StartQuiz.dart';
import 'package:bluetrack/Maladie.dart';

//import 'package:bluetrack/widget/messaging_widget.dart';
import 'package:bluetrack/Statistiques/StatistiquesHome.dart';
import 'package:flutter/cupertino.dart';


import '../Home.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  NotificationClickedEvent,
  StatisticClickedEvent,
  QuizClickedEvent,
  ConseilClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => StatistiquesHome();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield StatistiquesHome();
        break;
      case NavigationEvents.NotificationClickedEvent:
        yield Maladie();
        break;
      case NavigationEvents.StatisticClickedEvent:
        yield SignUp();
        break;
      case NavigationEvents.QuizClickedEvent:
        yield StartQuizState();
        break;
      case NavigationEvents.ConseilClickedEvent:
        yield Conseils();
        break;
    }
  }
}
