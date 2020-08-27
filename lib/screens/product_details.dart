import 'package:flutter/material.dart';
import 'package:ecom_app/models/prodcuts.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail(this.product);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.product.name),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                child: Image.network(this.widget.product.photo),
              ),
              footer: Container(
                child: ListTile(
                  title: Text(this.widget.product.name),
                  trailing: Text(this.widget.product.price),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                textColor: Colors.redAccent,
                child: Row(
                  children: <Widget>[
                    Text('Add to cart'),
                    IconButton(
                        icon: Icon(Icons.shopping_cart), onPressed: () {})
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Detail'),
            subtitle: Text(this.widget.product.details),
          )
        ],
      ),
    );
  }
}
