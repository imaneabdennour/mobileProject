import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//*******************************************/
//this class is singlethon because we dont want the timer to be reseted
//everytime and we can call it like this :
// AlertNotificationService().init();
//*******************************************/

class AlertNotificationService {

  AlertNotificationService._();

  factory AlertNotificationService() => _instance;

  static final AlertNotificationService _instance = AlertNotificationService._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  Timer _timer;
  Future<void> init() async{
    if (!_initialized) {
      var initializationSettingsAndroid =
          AndroidInitializationSettings('covid');
      var initializationSettingsIOS = IOSInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocalNotification);
      var initializationSettings = InitializationSettings(
          initializationSettingsAndroid, initializationSettingsIOS);
      flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: selectNotification);
      _startShowingAlerts();
      _initialized = true;
      
    }
  }

  _startShowingAlerts() async {
    //you can change the notification interval as u like from 
    //there another params like ==> minutes, hours ...
    const oneSec = const Duration(minutes: 5);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      _showNotification();
    });
  }

  Future _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 
        'your channel name', 
        'your channel description',
        importance: Importance.Max,
        priority: Priority.High, 
        ticker: 'ticker'
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 
        'Conseils', 
         shuffleAlerts(), 
        platformChannelSpecifics,
        payload: 'item x');
  }

  String shuffleAlerts() {
    //this list should contains the messages 
    List<String> list = ['Respectez les mesures de distanciation sociales', 'Portez un masque.', 'Limitez les interactions sociales.', 'Lavez-vous régulièrement les mains.', 'Toussez dans un mouchoir', 'Restez chez vous autant que possible.', 'Ne pas touchez le visage', 'Saluez sans serrer la main.', "N'embrassez personne.", 'Faisez le test du covid-19'];
    list.shuffle();
    return list[0];
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) => CupertinoAlertDialog(
    //         title: Text(title),
    //         content: Text(body),
    //         actions: [
    //           CupertinoDialogAction(
    //             isDefaultAction: true,
    //             child: Text('Ok'),
    //             onPressed: null
    //           )
    //         ],
    //       ),
    // );
    print("onDidReceiveLocalNotif");
  }
}
