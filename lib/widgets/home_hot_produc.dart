import 'package:flutter/material.dart';
import 'package:ecom_app/models/prodcuts.dart';

import 'package:ecom_app/screens/product_details.dart';

class HomeHotProduct extends StatefulWidget {
  final Product product;
  HomeHotProduct(this.product);
  @override
  _HomeHotProductState createState() => _HomeHotProductState();
}

class _HomeHotProductState extends State<HomeHotProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 190.0,
        width: 260.0,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(this.widget.product),
              ),
            );
          },
          child: Card(
              child: Column(
            children: <Widget>[
              Image.network(
                widget.product.photo,
                height: 160.0,
              ),
              Text(widget.product.name),
              Text('Price: ${this.widget.product.price}'),
            ],
          )),
        ),
      ),
    );
  }
}
