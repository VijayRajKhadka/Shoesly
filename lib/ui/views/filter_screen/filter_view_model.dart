import 'package:stacked/stacked.dart';

class FilterViewModel extends BaseViewModel {
  // Define the filters as properties
  String selectedBrand = 'NIKE';
  double minPrice = 200;
  double maxPrice = 1750;
  String sortBy = 'Most recent';
  String gender = 'Man';
  String color = 'Black';

  // Add methods to update the filters
  void setSelectedBrand(String brand) {
    selectedBrand = brand;
    notifyListeners();
  }

  void setPriceRange(double min, double max) {
    minPrice = min;
    maxPrice = max;
    notifyListeners();
  }

  void setSortBy(String sort) {
    sortBy = sort;
    notifyListeners();
  }

  void setGender(String selectedGender) {
    gender = selectedGender;
    notifyListeners();
  }

  void setColor(String selectedColor) {
    color = selectedColor;
    notifyListeners();
  }

  void resetFilters() {
    selectedBrand = 'NIKE';
    minPrice = 200;
    maxPrice = 1750;
    sortBy = 'Most recent';
    gender = 'Man';
    color = 'Black';
    notifyListeners();
  }

  void applyFilters() {
    // Implement the logic to apply filters
  }
}
