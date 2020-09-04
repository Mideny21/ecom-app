class Product {
  int id;
  String name;
  String photo;
  int price;
  int discount;
  String details;
  int quantity;

  toMap() {
    var map = Map<String, dynamic>();
    map['productId'] = id;
    map['productName'] = name;
    map['productPhoto'] = photo;
    map['productPrice'] = price;
    map['productQuantity'] = quantity;
    return map;
  }

  fromMap() {}
}
