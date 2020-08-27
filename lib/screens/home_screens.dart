import 'package:flutter/material.dart';
import 'dart:convert';

// WIDGET
import 'package:ecom_app/widgets/carousel.dart';
import 'package:ecom_app/widgets/home_categories.dart';
import 'package:ecom_app/widgets/home_hot_producs.dart';

// SERVICES
import 'package:ecom_app/services/slider_service.dart';
import 'package:ecom_app/services/category_service.dart';
import 'package:ecom_app/services/Product_service.dart';

//MODELS
import 'package:ecom_app/models/category.dart';
import 'package:ecom_app/models/prodcuts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SliderService _sliderService = SliderService();
  CategoryService _categoryService = CategoryService();
  ProductService _productService = ProductService();

  List<Product> _productList = List<Product>();
  List<Category> _categoryList = List<Category>();

  var items = [];

  @override
  void initState() {
    super.initState();

    _getAllSliders();
    _getAllCategories();
    _getAllProducts();
  }

  _getAllSliders() async {
    var sliders = await _sliderService.getSliders();
    var result = json.decode(sliders.body);
    result['data'].forEach((data) {
      setState(() {
        items.add(Image.network(data["image_url"]));
      });
    });
  }

  _getAllCategories() async {
    var categories = await _categoryService.getCategories();
    var results = json.decode(categories.body);
    results['data'].forEach((data) {
      var model = Category();
      model.id = data['id'];
      model.name = data['categoryName'];
      model.icon = data['categoryIcon'];
      setState(() {
        _categoryList.add(model);
      });
    });
  }

  _getAllProducts() async {
    var hotProducts = await _productService.getHotProducts();
    var hot = json.decode(hotProducts.body);
    hot["data"].forEach((data) {
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'];
      model.price = data['price'];
      model.details = data['detail'];

      // model.discount = data['discount'];
      setState(() {
        _productList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ecomm App'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(height: 200, child: carouselSlider(items)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('product Categories'),
            ),
            HomeProductCategories(
              categoryList: _categoryList,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Hot Products'),
            ),
            Container(
              child: HomeHotProducts(
                productList: _productList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
