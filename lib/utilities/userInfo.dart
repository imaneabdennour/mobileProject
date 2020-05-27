
import 'dart:async';

import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

  openConnection() async{
final Future<Database> database = openDatabase(
  // Set the path to the database.
    join(await getDatabasesPath(), 'userInfo_database.db'),
// When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
// Run the CREATE TABLE statement on the database.
return db.execute(
"CREATE TABLE userInfo(id INTEGER PRIMARY KEY, isFirstVisite INTEGER, isLoged INTEGER)",
);
},
// Set the version. This executes the onCreate function and provides a
// path to perform database upgrades and downgrades.
version: 1,
);

}
 getVisitingFlag()  async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    bool alreadyVisited = prefs.getBool('alreadyVisited') ?? false;
    return alreadyVisited;


}
Future<void> setVisitingFlag() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('alreadyVisited', true);

}