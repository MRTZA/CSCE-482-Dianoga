import 'package:flutter/material.dart';
import 'login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recycle',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.white,
        backgroundColor: Colors.lightGreen[300],
      ),
      home: LoginPage(title: 'Dianoga'),
    );
  }
}
