import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends BaseViewModel {
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
    print("CART");

  }

  void addToCart(){
    print("CART");
    print(selectedColor);
    print(selectedSize);
  }
}
