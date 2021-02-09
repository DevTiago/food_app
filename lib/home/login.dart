import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.grey[300], elevation: 0),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            color: Colors.grey[300],
            height: size.height / 6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'login'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    Text('Entre com o seu email e password', style: TextStyle(color: Colors.black),)
                  ],
                ),
                Image.network("https://cdn1.iconfinder.com/data/icons/beverage-2/440/Asset_2-512.png")
              ],
            )));
  }
}
