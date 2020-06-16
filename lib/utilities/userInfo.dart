
import 'package:shared_preferences/shared_preferences.dart';





 getVisitingFlag()  async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    bool alreadyVisited = prefs.getBool('alreadyVisited') ?? false;
    return alreadyVisited;


}
Future<void> setVisitingFlag() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('alreadyVisited', true);

}