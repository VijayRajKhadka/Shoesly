import 'package:flutter/material.dart';
import 'package:shoesly/core/helper/assets_helper.dart';
import 'package:shoesly/ui/views/filter_screen/filter_view_model.dart';
import 'package:stacked/stacked.dart';

class FilterView extends  StackedView<FilterViewModel>{
  const FilterView({super.key});

  @override
  Widget builder(BuildContext context, FilterViewModel viewModel, Widget? child) {
    // TODO: implement builder
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Filter", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Brands
            Text('Brands'),
          Wrap(
            spacing: 10,
            children: [
              AssetsHelper.jordanImage,
              'Puma',
              'Adidas',
              'Reebok'
            ].map((brand) {
              bool isSelected = viewModel.selectedBrand == brand;

              return Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      InkWell(
                          onTap: () => viewModel.setSelectedBrand(brand),

                        child: CircleAvatar(
                          radius: 30, // Adjust size as needed
                          backgroundColor: isSelected ? Colors.green : Colors.grey,
                          backgroundImage: AssetImage(brand),
                          child: brand is String
                              ? Text(
                            brand.substring(0, 1), // Display first letter of brand
                            style: TextStyle(color: Colors.white),
                          )
                              : null,
                        ),
                      ),
                      if (isSelected)
                        Positioned(
                          bottom: -8,
                          right: -8,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(Icons.check, size: 16, color: Colors.green),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    brand is String ? brand : '', // Display brand name if it's a string
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }).toList(),
          ),



            SizedBox(height: 30),

            // Price Range
            Text('Price Range', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            Column(
              children: [
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
                  inactiveColor: Colors.grey,

                  onChanged: (values) => viewModel.setPriceRange(values.start, values.end),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$0"),
                      Text('\$${viewModel.minPrice.round()}', style: TextStyle(fontWeight: FontWeight.bold),), // Display min value
                      Text('\$${viewModel.maxPrice.round()}', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("\$1750"),// Display max value
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Sort By
            Text('Sort By'),

            SizedBox(height: 16),

            // Gender
            Text('Gender'),

            SizedBox(height: 16),

            // Color
            Text('Color'),
            
          ],
        ),
      ),
    );

  }

  @override
  FilterViewModel viewModelBuilder(BuildContext context) => FilterViewModel();

}