import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class CheckOutViewModel extends BaseViewModel {
  String? _selectedPaymentMethod ="Credit Card";
  String? get selectedPaymentMethod => _selectedPaymentMethod;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController locationEditor = TextEditingController();

  String? _selectedLocation;
  String? get selectedLocation => _selectedLocation;

  Stream<QuerySnapshot> get cartItems {
    print("snapshot");
    final snapshot =  _firestore
        .collection('cart')
        .snapshots();
    print(snapshot);
    return snapshot;
  }

  //logic for placing order
  Future<bool> placeOrder({
    required String brand,
    required String color,
    required double price,
    required int quantity,
    required String shoeName,
    required int size,
    required String location,
    required String paymentMethod
  }) async {
    try {
      await FirebaseFirestore.instance.collection('order').add({
        'brand': brand,
        'color': color,
        'total_price': price,
        'quantity': quantity,
        'shoe_name': shoeName,
        'size': size,
        'location': location,
        'paymentMethod': paymentMethod
      });
      return true; // Success
    } catch (e) {
      print('Error adding to cart: $e');
      return false; // Failure
    }
  }


  //clearing the cart collection after ordering shoe
  Future<void> deleteCollection() async {
    QuerySnapshot querySnapshot = await _firestore.collection('cart').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await doc.reference.delete();
    }

    print('Collection  deleted successfully.');
  }

  void setSelectedPaymentMethod(String paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  void setSelectedLocation(String location) {
    _selectedLocation = location;
    notifyListeners();
  }
}
