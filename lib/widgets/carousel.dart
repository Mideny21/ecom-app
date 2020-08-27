import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

Widget carouselSlider(items) => Container(
      child: Carousel(
        boxFit: BoxFit.cover,
        images: items,
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
