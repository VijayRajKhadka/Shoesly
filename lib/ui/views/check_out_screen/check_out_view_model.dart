import 'package:stacked/stacked.dart';

class CheckOutViewModel extends BaseViewModel {
  String? _selectedPaymentMethod ="Credit Card";
  String? get selectedPaymentMethod => _selectedPaymentMethod;

  String? _selectedLocation;
  String? get selectedLocation => _selectedLocation;

  void setSelectedPaymentMethod(String paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  void setSelectedLocation(String location) {
    _selectedLocation = location;
    notifyListeners();
  }
}
