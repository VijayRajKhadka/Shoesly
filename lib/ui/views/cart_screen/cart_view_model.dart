import 'package:stacked/stacked.dart';

class CartViewModel extends BaseViewModel {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void removeItem(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}

class CartItem {
  // Define your CartItem properties
}
