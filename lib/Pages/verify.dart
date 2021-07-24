import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  @override
  void initState() {
    user = auth.currentUser;
    user!.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkemailverified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("verify Email sent to ${user!.emailVerified}"),
      ),
    );
  }

  Future<void> checkemailverified() async {
    user = auth.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      timer!.cancel();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
