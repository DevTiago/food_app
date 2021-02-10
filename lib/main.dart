import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/home/login.dart';
import 'package:food_app/initial/initial_screen.dart';

import 'home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        backgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => InitialScreen(),
        '/login': (context) => Login(),
        '/initial': (context) => InitialScreen(),
      },
    );
  }
}
