import 'package:flutter/material.dart';

import 'package:ecom_app/models/prodcuts.dart';

import 'package:ecom_app/widgets/home_hot_produc.dart';

class HomeHotProducts extends StatefulWidget {
  final List<Product> productList;
  HomeHotProducts({this.productList});
  @override
  _HomeHotProductsState createState() => _HomeHotProductsState();
}

class _HomeHotProductsState extends State<HomeHotProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.productList.length,
        itemBuilder: (context, index) {
          return HomeHotProduct(this.widget.productList[index]);
        },
      ),
    );
  }
}
