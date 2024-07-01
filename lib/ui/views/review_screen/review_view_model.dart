import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ReviewViewModel extends BaseViewModel {
  double _selectedItem = 1.0;
  final NavigationService _navigationService = locator<NavigationService>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  double get selectedItem => _selectedItem;

  Stream<QuerySnapshot> get shoesStream {
    if (_selectedItem == 1.0) {
      return _firestore.collection('reviews').snapshots();
    } else {
      return _firestore
          .collection('reviews')
          .where('rating', isGreaterThanOrEqualTo: _selectedItem )
          .where('rating', isLessThanOrEqualTo: _selectedItem+1)
          .snapshots();
    }
  }

  void setSelectedItem(double item) {
    _selectedItem = item;
    notifyListeners();
  }
}