import 'package:flutter/material.dart';

import 'package:ecom_app/screens/product_category_screen.dart';

class HomeProductCategory extends StatefulWidget {
  final int categoryId;
  final String categoryIcon;
  final String categoryName;

  HomeProductCategory(this.categoryIcon, this.categoryName, this.categoryId);
  @override
  _HomeProductCategoryState createState() => _HomeProductCategoryState();
}

class _HomeProductCategoryState extends State<HomeProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      width: 190.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsByCategoryScreen(
                    categoryName: widget.categoryName,
                    categoryId: widget.categoryId),
              ));
        },
        child: Card(
            child: Column(
          children: <Widget>[
            Image.network(
              widget.categoryIcon,
              width: 190.0,
              height: 160.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.categoryName),
            ),
          ],
        )),
      ),
    );
  }
}
