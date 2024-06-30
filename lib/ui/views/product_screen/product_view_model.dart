import 'package:flutter/material.dart';
import 'package:shoesly/app/app.locator.dart';
import 'package:shoesly/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  int selectedSize = 41; // Track selected size
  Color? selectedColor = Colors.green; // Track selected color

  void setSize(int size) {
    selectedSize = size;
    print(selectedSize);
    notifyListeners();
  }

  void selectColor(Color color) {
    selectedColor = color;
    print(selectedColor);
    notifyListeners();
  }

  void seeAllReviews() {
     _navigationService.navigateToReviewView();
    print("CART");

  }

  void addToCart(){
    print("CART");
    print(selectedColor);
    print(selectedSize);
  }

  void goToCart(){
    _navigationService.navigateToCartView();

  }
}
