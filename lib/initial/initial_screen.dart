import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/components/carousel.dart';
import 'package:http/http.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  var slides = new List();
  List<dynamic> restaurantCategories;


    Future getSlides() async {
      String url = "https://sandbox.pedecome.pt/api/promo-slider";
      Map<String, String> headers = {"Content-type": "application/json"};
      try {
        Response response = await post(url, headers: headers);
        Map data = jsonDecode(response.body);
        data['mainSlides'].forEach((slide) => slides.add(slide['image_placeholder']));
      } catch (e) {
        print(e);
      }
    }

    Future getRestaurantCategories() async {
      String url = 'https://sandbox.pedecome.pt/api/get-restaurant-categories';
      Map<String, String> headers = {"Content-type": "application/json"};
      try {
        Response response = await post(url, headers: headers);
        List<dynamic> data = jsonDecode(response.body);
        setState(() => restaurantCategories = data);
      } catch (e) {
        print(e);
      }
    }


@override
  // ignore: must_call_super
  void initState()  {
     getSlides();
     getRestaurantCategories();
  }

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return Image.network('https://images.pedecome.pt/assets/img/logos/logo.jpg?v=1578078043WAdf1');
          }
        ),
      ),
      body: Column(
        children: [
          Carousel(slides: slides),
          Container(
            width: size.width - 5,
            height: size.width / 4,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),

        ],
      ),
    );
  }
}
