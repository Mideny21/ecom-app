import 'package:flutter/material.dart';
import 'package:ecom_app/models/prodcuts.dart';
import 'package:ecom_app/services/cart_service.dart';
import 'package:ecom_app/screens/cart_screen.dart';

// import 'package:flutter_html/flutter_html.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail(this.product);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CartService _cartService = CartService();
  List<Product> _cartItems;

  @override
  void initState() {
    super.initState();
    _getCartItems();
  }

  _getCartItems() async {
    _cartItems = List<Product>();
    var cartItems = await _cartService.getCartItems();
    cartItems.forEach((data) {
      var product = Product();
      product.id = data['productId'];
      product.name = data['productName'];
      product.photo = data['productPhoto'];
      product.price = data['productPrice'];
      // product.details = data['productDetail'] ?? 'No detail';
      product.quantity = data['productQuantity'];

      setState(() {
        _cartItems.add(product);
      });
    });
  }

  _addToCart(BuildContext context, Product product) async {
    var result = await _cartService.addToCart(product);
    if (result > 0) {
      _getCartItems();
      _showSnackMessage(Text(
        'Item added to cart successfully!',
        style: TextStyle(color: Colors.green),
      ));
    } else {
      _showSnackMessage(Text(
        'Failed to add to cart!',
        style: TextStyle(color: Colors.red),
      ));
    }
  }

  _showSnackMessage(message) {
    var snackBar = SnackBar(
      content: message,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(this.widget.product.name),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreen(_cartItems)));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                width: 30,
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      iconSize: 30,
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                      child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                              size: 25, color: Colors.black),
                          Positioned(
                            top: 4.0,
                            right: 8.0,
                            child: Center(
                                child: Text(_cartItems.length.toString())),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
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
                  trailing: Text(this.widget.product.price.toString()),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  _addToCart(context, this.widget.product);
                },
                textColor: Colors.redAccent,
                child: Row(
                  children: <Widget>[
                    Text('Add to cart'),
                    IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          _addToCart(context, this.widget.product);
                        })
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Detail'),
            // subtitle: Html(data: this.widget.product.details),
          )
        ],
      ),
    );
  }
}
