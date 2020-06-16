import 'package:bloc/bloc.dart';
import 'package:bluetrack/Quiz.dart';
import 'package:bluetrack/Statistiques/StatistiquesHome.dart';

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
        yield Home();
        break;
      case NavigationEvents.StatisticClickedEvent:
        yield Home();
        break;
      case NavigationEvents.QuizClickedEvent:
        yield Quiz();
        break;
      case NavigationEvents.ConseilClickedEvent:
        yield Home();
        break;
    }
  }
}
