import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/utils.dart';

import 'HomePage.dart';
import 'login_Page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => loginPage(),
        MyRouts.homeRout: (context) => HomePage(),
        MyRouts.loginRout: (context) => loginPage()
      },
    );
  }
}

