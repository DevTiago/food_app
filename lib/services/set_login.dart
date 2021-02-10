import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SetLogin {

  String email;
  String password;

  String name;
  String address;
  bool isUser;


  SetLogin({ this.email, this.password});

  Future<void> login(email, password) async {
    String url = "https://sandbox.pedecome.pt/api/login";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"email": "$email", "password": "$password"}';

    try {
        Response response = await post(url, headers: headers, body: json);
        Map data = jsonDecode(response.body);

        name = data['data']['name'];
        address = data['data']['default_address']['address'];
        isUser = true;

    } catch (e) {
      print(e);
      isUser = false;
    }
  }


}
