import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final double salePrice;
  final String id;
  final String picture;
  final double price;

  Product(
      {@required this.picture,
      @required this.price,
      @required this.name,
      @required this.salePrice,
      @required this.id});
}

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> _similarItems = [];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get similarItems {
    return [..._similarItems];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }

  Product findSimilarItemsById(String id) {
    return _similarItems.firstWhere((pdt) => pdt.id == id);
  }
}
