import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ReviewViewModel extends BaseViewModel{
  String _selectedItem = "All";
  final NavigationService _navigationService = locator<NavigationService>();

  String get selectedItem => _selectedItem;


  void setSelectedItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }

}