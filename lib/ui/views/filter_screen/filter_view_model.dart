import 'package:stacked/stacked.dart';

class FilterViewModel extends BaseViewModel {
  String selectedBrand = 'Nike'; // Example initial brand
  double minPrice = 400;
  double maxPrice = 1300;
  String sortBy = 'Most recent'; // Initial sort by criteria
  String colorBy = 'White'; // Initial sort by criteria
  String gender = 'Man';
  String color = 'Black';

  // Add methods to update the filters
  void setSelectedBrand(String brand) {
    selectedBrand = brand;
    print(brand);
    notifyListeners();
  }

  void setPriceRange(double min, double max) {
    minPrice = min;
    maxPrice = max;
    notifyListeners();
  }

  void setSortBy(String sort) {
    sortBy = sort;
    print(sort);
    notifyListeners();
  }

  void setGender(String selectedGender) {
    gender = selectedGender;
    print(gender);
    notifyListeners();
  }

  void setSortColor(String selectedColor) {
    colorBy = selectedColor;
    print(colorBy);
    notifyListeners();
  }

  void setColor(String selectedColor) {
    color = selectedColor;
    notifyListeners();
  }

  void resetFilters() {
    selectedBrand = 'Nike';
    minPrice = 400;
    maxPrice = 1300;
    sortBy = 'Most recent';
    gender = 'Man';
    color = 'Black';
    notifyListeners();
  }

  void applyFilters() {
    // Implement the logic to apply filters
  }
}