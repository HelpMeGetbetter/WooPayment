import 'package:flutter/foundation.dart';
import 'package:flutter_auth/Model/products.dart';

class CartModel with ChangeNotifier{
  final String id;
  final String name;
  final int quantity;
  final String picture;
  final double price;
  final double salePrice;

  CartModel({@required this.salePrice, @required this.picture,
      @required this.id,
        @required this.name,
        this.quantity,
        @required this.price,});
}

class CartModels with ChangeNotifier {
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(CartModel cartModel) {
    if (_items.containsKey(cartModel.id)) {
      _items.update(
          cartModel.id,
              (existingCartItem) =>
              CartModel(
                  id: cartModel.id,
                  name: cartModel.name,
                  quantity: existingCartItem.quantity + 1,
                  price: cartModel.salePrice, picture: cartModel.picture, salePrice: cartModel.price));
    } else {
      _items.putIfAbsent(
          cartModel.id,
              () =>
              CartModel(
                name: cartModel.name,
                id: cartModel.id,
                quantity: 1,
                price: cartModel.salePrice, picture: cartModel.picture, salePrice: cartModel.price,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
              (existingCartItem) =>
              CartModel(
                  id: DateTime.now().toString(),
                  name: existingCartItem.name,
                  quantity: existingCartItem.quantity - 1,
                  price: existingCartItem.price, picture: existingCartItem.picture, salePrice: existingCartItem.salePrice));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}