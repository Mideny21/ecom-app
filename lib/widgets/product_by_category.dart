import 'package:flutter/material.dart';

import 'package:ecom_app/screens/product_details.dart';

import 'package:ecom_app/models/prodcuts.dart';

class ProductByCategory extends StatefulWidget {
  final Product product;
  ProductByCategory(this.product);
  @override
  _ProductByCategoryState createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 190,
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
              Text(this.widget.product.name),
              Image.network(
                widget.product.photo,
                width: 190.0,
                height: 160.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Price: ${this.widget.product.price}'),
                  // Text('Discount: ${this.widget.product.discount}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
