import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends BaseViewModel {
  int selectedSize = 41; // Track selected size
  Color? selectedColor; // Track selected color

  // List of available colors
  List<Color> colors = [
    Colors.white,
    Colors.blue,
    Colors.green,
    Colors.black,
  ];

  void setSize(int size) {
    selectedSize = size;
    print(selectedSize);
    notifyListeners(); // Notify listeners to update UI
  }

  void selectColor(Color color) {
    selectedColor = color;
    print(selectedColor);
    notifyListeners(); // Notify listeners to update UI
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
