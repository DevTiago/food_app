import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key key, this.slides}) : super(key: key);

  final List slides;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0, viewportFraction: 1, enableInfiniteScroll: true, autoPlay: true,),
      items: slides.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(i),
                      fit: BoxFit.contain,
                    )
                ),
            );
          },
        );
      }).toList(),
    );
  }
}
