import 'package:bloc/bloc.dart';

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
  NavigationStates get initialState => Home();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Home();
        break;
      case NavigationEvents.NotificationClickedEvent:
        yield Home();
        break;
      case NavigationEvents.StatisticClickedEvent:
        yield Home();
        break;
      case NavigationEvents.QuizClickedEvent:
        yield ();
        break;
      case NavigationEvents.ConseilClickedEvent:
        yield Home();
        break;
    }
  }
}
