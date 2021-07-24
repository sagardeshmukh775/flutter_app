

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/verify.dart';
import 'package:flutter_app/utils/utils.dart';

import 'HomePage.dart';

class loginPage extends StatelessWidget {
    String? email;
    String? password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login Here",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),

              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Email", labelText: "Email"),
                      onChanged: (value) {
                        setState() {
                          email = value.trim();
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      onChanged: (value) {
                        setState() {
                          password = value.trim();
                        }
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          child: Text("Login"),
                          style: TextButton.styleFrom(minimumSize: Size(160, 45)),
                          onPressed: () {
                            auth.signInWithEmailAndPassword(email: email, password: password).then((_){
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            });
                          },
                        ),
                        ElevatedButton(
                          child: Text("SignUp"),
                          style: TextButton.styleFrom(minimumSize: Size(160, 45)),
                          onPressed: () {
                            
                              auth.createUserWithEmailAndPassword(
                                  email: email, password: password).then((_){
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => VerifyScreen()));
                              });
                             
                           
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
