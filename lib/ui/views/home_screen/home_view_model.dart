import 'package:shoesly/app/app.locator.dart';
import 'package:shoesly/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  String _selectedItem = "All";
  final NavigationService _navigationService = locator<NavigationService>();

  String get selectedItem => _selectedItem;

  bool _isFilterButtonVisible = true;

  bool get isFilterButtonVisible => _isFilterButtonVisible;

  void showFilterButton() {
    if (!_isFilterButtonVisible) {
      _isFilterButtonVisible = true;
      notifyListeners();
    }
  }

  void hideFilterButton() {
    if (_isFilterButtonVisible) {
      _isFilterButtonVisible = false;
      notifyListeners();
    }
  }
  void setSelectedItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }

   void goToProduct(){
    _navigationService.navigateToProductView();
   }

   void goToCart(){
     _navigationService.navigateToCartView();

   }
}
