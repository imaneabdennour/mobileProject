import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {

  PushNotificationService._();

  factory PushNotificationService() => _instance;

  static final PushNotificationService _instance = PushNotificationService._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  //
  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
      );

      // For testing purposes print the Firebase Messaging token
      String token = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $token");
      
      _initialized = true;
    }
  }

  void storeToken() async {
    bool tokenExists = false;
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final Firestore _firestore = Firestore.instance;
    String token = await _firebaseMessaging.getToken();

    FirebaseUser user = await _firebaseAuth.currentUser();
    DocumentReference ref = _firestore.collection('users').document(user.uid);
    tokenExists = (await ref
        .get()
        .then((dataSnapshot) => (dataSnapshot.data["device_token"] != null)));
    print("======= User Connected : " + user.uid);
    
    print(
        "dosn't exists so i am storing your token for the first and only time");
    print("......storing token ");
    await (ref.updateData({'device_token': token}));
    print("......end storing token ");
  }


   /*update(String token) {
    print(token);
    DatabaseReference databaseReference = new FirebaseDatabase().reference();
    databaseReference.child('fcm-token/${token}').set({"token": token});
    textValue = token;
    setState(() {});
  }*/
}