import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:periup/pages/home_page.dart';
import 'package:periup/pages/user_form.dart';
import 'package:periup/utils/firebase_user_authentication.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuthentication firebaseGoogleAuthentication =
      FirebaseAuthentication();

  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    var signInAppBar = AppBar(
      elevation: 0.0,
      backgroundColor: Colors.lightBlueAccent,
    );

    var signInBody = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlueAccent, Colors.lightGreenAccent])),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 190.0, bottom: 10.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                          NetworkImage("https://goo.gl/images/1hPNn2"))),
                ),
              ),
              Text("Periup",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400)),
              Padding(
                padding: const EdgeInsets.only(top: 38.0, bottom: 40.0),
                child: Text(
                  "Gearing up for periods with dignity!" +
                      "\n" +
                      "This app aims at building a global community of women sharing their " +
                      "menstruation stories, challenges and taboos.",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                onPressed: () => firebaseGoogleAuthentication
                        .firebaseGoogleSignIn()
                        .then((FirebaseUser user) {
                      print(user);
                      this.user = user;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDetailPage(this.user,
                                  this.firebaseGoogleAuthentication)));
//                  Navigator.push( context, MaterialPageRoute(builder: (context)=> HomePage(firebaseUser: this.user,firebaseGoogleAuthentication: this.firebaseGoogleAuthentication,)));
                    }),
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                              NetworkImage(""))),
                    ),
                    Text(
                      " Sign In ",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

    return Scaffold(appBar: signInAppBar, body: signInBody);
  }
}
