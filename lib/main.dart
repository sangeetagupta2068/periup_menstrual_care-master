import 'package:flutter/material.dart';
import 'pages/sign_up_page.dart';
//import 'utils/calendar_operation.dart';
import 'pages/calendar_page.dart';
import 'pages/menstrual_story_add_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
    );
  }
}
