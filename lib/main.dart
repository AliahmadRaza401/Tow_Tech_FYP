import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tow_tech_fyp/pages/SignUpPage.dart';
import 'package:tow_tech_fyp/pages/Home/home.dart';
import 'package:tow_tech_fyp/pages/name.dart';

import 'Service/Auth_Service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = SignUpPage();
  AuthClass authClass = AuthClass();
  User firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (firebaseUser != null) {
      setState(() {
        currentPage = Home();
      });
    }

    checkLogin();
  }

  void checkLogin() async {
    String token = await authClass.getToken();
    if (token != null) {
      setState(() {
        currentPage = Home();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.red[800],
        accentColor: Colors.orange[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: currentPage,
    );
  }
}
