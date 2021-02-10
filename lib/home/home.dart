import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(children: <Widget>[
          Center(
            child: Image.network(
              "https://images.pedecome.pt/assets/img/firstscreenhero.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.0),
          Text('O que lhe apetece comer hoje?'.toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0)),
          SizedBox(height: 20.0),
          Text('Escolha o restaurante e encomende já!',
              style: TextStyle(color: Colors.black, fontSize: 12.0)),
          SizedBox(height: 20.0),
          FlatButton(
              onPressed: () {},
              padding: EdgeInsets.all(20.0),
              color: Colors.orange[800],
              child: Text(
                'A sua localização'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              )),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeftWithFade, child: Login()));
            },
            child: RichText(
                text: TextSpan(
                    text: "Já está registado?",
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: ' Login',
                      style: TextStyle(color: Colors.orange[800]))
                ])),
          )
        ]),
      ),
    );
  }
}
