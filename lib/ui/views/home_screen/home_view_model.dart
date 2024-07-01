import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/shoe_model.dart';

class HomeViewModel extends BaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final NavigationService _navigationService = locator<NavigationService>();

  bool _isFilterButtonVisible = true;
  bool get isFilterButtonVisible => _isFilterButtonVisible;

  String _selectedItem = "All";
  String get selectedItem => _selectedItem;

  Map<String, double> _ratings = {};
  Map<String, double> get ratings => _ratings;

  Stream<QuerySnapshot> get shoesStream {
    if (_selectedItem == "All") {
      return _firestore.collection('shoes').snapshots();
    } else {
      return _firestore
          .collection('shoes')
          .where('brand', isEqualTo: _selectedItem)
          .snapshots();
    }
  }

  void setSelectedItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }

  void showFilterButton() {
    if (!_isFilterButtonVisible) {
      _isFilterButtonVisible = true;
    }
  }

  void hideFilterButton() {
    if (_isFilterButtonVisible) {
      _isFilterButtonVisible = false;
    }
  }

  void goToCart() {
   _navigationService.navigateToCartView();
  }

  goToProduct(Shoe shoeModel, double shoeRating) {
    shoeModel.rating;
    _navigationService.navigateToProductView(shoeModel: shoeModel,shoeRating: shoeRating);
  }

  Future<double> fetchAverageRatingForShoe(String shoeId) async {
    try {
      final querySnapshot = await _firestore
          .collection('rating')
          .where('shoe_id', isEqualTo: shoeId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        double totalRating = 0.0;
        int count = 0;
        for (var doc in querySnapshot.docs) {
          totalRating += doc['rating'];
          count++;
        }
        notifyListeners();
        return totalRating / count;

      } else {
        return 0.0;
      }
    } catch (e) {
      print('Error fetching ratings: $e');
      return 0.0;
    }
  }

  Future<void> fetchRatingsForShoes() async {
    try {
      final shoesSnapshot = await _firestore.collection('shoes').get();
      for (var shoeDoc in shoesSnapshot.docs) {
        final shoeId = shoeDoc.id;
        final avgRating = await fetchAverageRatingForShoe(shoeId);
        _ratings[shoeId] = avgRating;
      }
      notifyListeners();
    } catch (e) {
      print('Error fetching shoes: $e');
    }
  }
}
