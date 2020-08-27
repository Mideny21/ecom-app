import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:ecom_app/services/Product_service.dart';
import 'package:ecom_app/widgets/product_by_category.dart';

import 'package:ecom_app/models/prodcuts.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  final String categoryName;
  final int categoryId;

  ProductsByCategoryScreen({this.categoryName, this.categoryId});
  @override
  _ProductsByCategoryScreenState createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  ProductService _productService = ProductService();

  List<Product> _productListByCategory = List<Product>();

  _getProductByCategory() async {
    var products =
        await _productService.getProductByCategoryId(this.widget.categoryId);
    var _list = json.decode(products.body);
    _list['data'].forEach((data) {
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'];
      model.price = data['price'];
      model.details = data['detail'];

      // model.id = data['discount'];

      setState(() {
        _productListByCategory.add(model);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getProductByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.widget.categoryName)),
      body: Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.height / 800,
            ),
            itemCount: _productListByCategory.length,
            itemBuilder: (context, index) {
              return ProductByCategory(this._productListByCategory[index]);
            }),
      ),
    );
  }
}
