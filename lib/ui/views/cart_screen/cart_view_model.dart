import 'package:shoesly/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class CartViewModel extends BaseViewModel {
  List<CartItem> _cartItems = [];
  final NavigationService _navigationService = locator<NavigationService>();

  List<CartItem> get cartItems => _cartItems;

  void removeItem(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
  void goToCheckOut(){
  _navigationService.navigateToCheckOutView();
}
}

class CartItem {
  // Define your CartItem properties
}
