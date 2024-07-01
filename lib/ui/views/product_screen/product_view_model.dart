import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/app/app.locator.dart';
import 'package:shoesly/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  int selectedSize = 41; // Track selected size
  String selectedColor = "Green"; // Track selected color

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Stream<QuerySnapshot> get topRatedReviewsStream {
    print("snapshot");
    final snapshot =  _firestore
        .collection('reviews')
        .orderBy('rating', descending: true)
        .limit(10)
        .snapshots();
    print(snapshot);
    return snapshot;
  }
  Future<bool> addToCart({
    required String brand,
    required String color,
    required double price,
    required int quantity,
    required String shoeName,
    required int size,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('cart').add({
        'brand': brand,
        'color': color,
        'total_price': price,
        'quantity': quantity,
        'shoe_name': shoeName,
        'size': size,
      });
      return true; // Success
    } catch (e) {
      print('Error adding to cart: $e');
      return false; // Failure
    }
  }


  void setSize(int size) {
    selectedSize = size;
    print(selectedSize);
    notifyListeners();
  }

  void selectColor(String color) {
    selectedColor = color;
    print(selectedColor);
    notifyListeners();
  }

  void seeAllReviews(double rating) {
     _navigationService.navigateToReviewView(rating: rating);
    print("CART");

  }

  void goToCart(){
    _navigationService.navigateToCartView();

  }
}
