import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class CartViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  //getting grand total price
  // Stream<double> get grandTotalStream async* {
  //   double grandTotal = 0;
  //
  //   await for (QuerySnapshot snapshot in _firestore.collection('cart').snapshots()) {
  //     grandTotal = 0; // Reset grand total
  //     for (var doc in snapshot.docs) {
  //       grandTotal += doc['total_price'].toDouble();
  //     }
  //     yield grandTotal;
  //   }
  // }
  //updating quantity when changed
  Future<void> updateQuantity({
    required String cartItemId,
    required int newQuantity,
  }) async {
    try {
      await _firestore.collection('cart').doc(cartItemId).update({
        'quantity': newQuantity,
      });
    } catch (e) {
      print('Error updating quantity: $e');
    }
  }

  //getting cart details
  Stream<QuerySnapshot> get cart {
    print("snapshot");
    final snapshot =  _firestore
        .collection('cart')
        .snapshots();
    print(snapshot);
    return snapshot;
  }


  void removeItem(CartItem item) {

  }
  void goToCheckOut(){
  _navigationService.navigateToCheckOutView();
}
}

class CartItem {
  // Define your CartItem properties
}
