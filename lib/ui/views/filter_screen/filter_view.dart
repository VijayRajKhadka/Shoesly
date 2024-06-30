import 'package:flutter/material.dart';
import 'package:shoesly/core/helper/assets_helper.dart';
import 'package:shoesly/ui/views/filter_screen/filter_view_model.dart';
import 'package:shoesly/ui/widgets/filter_brand.dart';
import 'package:shoesly/ui/widgets/sort_by_button.dart';
import 'package:shoesly/ui/widgets/sort_by_color.dart';
import 'package:stacked/stacked.dart';

class FilterView extends  StackedView<FilterViewModel>{
  const FilterView({super.key});

  @override
  Widget builder(BuildContext context, FilterViewModel viewModel, Widget? child) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement builder
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Filter", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Stack(
        
        children:[ Container(
          height: screenHeight*1,
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Brands
              Text('Brands', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              SizedBox(height: 30),

              // Brand selection
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterBrand(
                      image: AssetsHelper.nikeLogo,
                      brandName: 'Nike',
                      itemCount: 1023, // Replace with actual item count
                      isSelected: viewModel.selectedBrand == 'Nike', // Adjust based on your logic
                      onTap: () => viewModel.setSelectedBrand('Nike'), // Adjust based on your view model method
                    ),
                    FilterBrand(
                      image: AssetsHelper.pumaLogo,
                      brandName: 'Puma',
                      itemCount: 950, // Replace with actual item count
                      isSelected: viewModel.selectedBrand == 'Puma', // Adjust based on your logic
                      onTap: () => viewModel.setSelectedBrand('Puma'), // Adjust based on your view model method
                    ),
                    FilterBrand(
                      image: AssetsHelper.adidasLogo,
                      brandName: 'Adidas',
                      itemCount: 1200, // Replace with actual item count
                      isSelected: viewModel.selectedBrand == 'Adidas', // Adjust based on your logic
                      onTap: () => viewModel.setSelectedBrand('Adidas'), // Adjust based on your view model method
                    ),
                    FilterBrand(
                      image: AssetsHelper.reebokLogo,
                      brandName: 'Reebok',
                      itemCount: 800, // Replace with actual item count
                      isSelected: viewModel.selectedBrand == 'Reebok', // Adjust based on your logic
                      onTap: () => viewModel.setSelectedBrand('Reebok'), // Adjust based on your view model method
                    ),
                    FilterBrand(
                      image: AssetsHelper.jordanLogo,
                      brandName: 'Jordan',
                      itemCount: 700, // Replace with actual item count
                      isSelected: viewModel.selectedBrand == 'Jordan', // Adjust based on your logic
                      onTap: () => viewModel.setSelectedBrand('Jordan'), // Adjust based on your view model method
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Price Range
              Text('Price Range', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              RangeSlider(
                values: RangeValues(viewModel.minPrice, viewModel.maxPrice),
                min: 0,
                max: 1750,
                divisions: 35,
                labels: RangeLabels(
                  '\$${viewModel.minPrice.round()}',
                  '\$${viewModel.maxPrice.round()}',
                ),
                activeColor: Colors.black,
                inactiveColor: Colors.black12,
                onChanged: (values) => viewModel.setPriceRange(values.start, values.end),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$0"),
                    Text('\$${viewModel.minPrice.round()}', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$${viewModel.maxPrice.round()}', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("\$1750"),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Sort By
              const Text('Sort By', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              const SizedBox(height: 25),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SortByButton(
                      selected: viewModel.sortBy == 'Most recent',
                      buttonFunction: () => viewModel.setSortBy('Most recent'),
                      buttonText: 'Most recent',
                    ),
                    const SizedBox(width: 10),
                    SortByButton(
                      selected: viewModel.sortBy == 'Lowest Price',
                      buttonFunction: () => viewModel.setSortBy('Lowest Price'),
                      buttonText: 'Lowest Price',
                    ),
                    const SizedBox(width: 10),
                    SortByButton(
                      selected: viewModel.sortBy == 'Highest Price',
                      buttonFunction: () => viewModel.setSortBy('Highest Price'),
                      buttonText: 'Highest Price',
                    ),
                    const SizedBox(width: 10),
                    SortByButton(
                      selected: viewModel.sortBy == 'High Rating',
                      buttonFunction: () => viewModel.setSortBy('High Rating'),
                      buttonText: 'High Rating',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Gender
              const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              const SizedBox(height: 20),
              Row(
                children: [
                  SortByButton(
                    selected: viewModel.gender == 'Man',
                    buttonFunction: () => viewModel.setGender('Man'),
                    buttonText: 'Man',
                  ),
                  const SizedBox(width: 10),
                  SortByButton(
                    selected: viewModel.gender == 'Women',
                    buttonFunction: () => viewModel.setGender('Women'),
                    buttonText: 'Women',
                  ),
                  const SizedBox(width: 10),
                  SortByButton(
                    selected: viewModel.gender == 'Unisex',
                    buttonFunction: () => viewModel.setGender('Unisex'),
                    buttonText: 'Unisex',
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Color
              const Text('Color', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SortByColor(
                      selected: viewModel.colorBy == Colors.white,
                      buttonFunction: () => viewModel.setSortColor('White'),
                      colorText: 'White',
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    SortByColor(
                      selected: viewModel.colorBy == Colors.black,
                      buttonFunction: () => viewModel.setSortColor('Black'),
                      colorText: 'Black',
                      color: Colors.black,
                    ),
                    const SizedBox(width: 10),
                    SortByColor(
                      selected: viewModel.colorBy == Colors.green,
                      buttonFunction: () => viewModel.setSortColor('Green'),
                      colorText: 'Green',
                      color: Colors.green,
                    ),
                    const SizedBox(width: 10),
                    SortByColor(
                      selected: viewModel.colorBy == Colors.blue,
                      buttonFunction: () => viewModel.setSortColor('Blue'),
                      colorText: 'Blue',
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Reset and Apply buttons

            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: screenWidth * 0.4,
              height: screenHeight * 0.06,
              child: ElevatedButton(
                onPressed: viewModel.resetFilters,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Text(
                  "RESET (4)",
                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.4,
              height: screenHeight * 0.06,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "APPLY",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        ),
        ]
      ),
    );


  }

  @override
  FilterViewModel viewModelBuilder(BuildContext context) => FilterViewModel();

}