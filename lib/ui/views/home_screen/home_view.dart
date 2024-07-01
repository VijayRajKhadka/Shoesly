import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoesly/ui/views/home_screen/home_view_model.dart';
import 'package:shoesly/ui/widgets/filter_button.dart';
import 'package:shoesly/ui/widgets/shoe_card.dart';
import 'package:shoesly/ui/widgets/top_scrolling_navbar.dart';
import 'package:stacked/stacked.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/shoe_model.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Discover",
                          style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: viewModel.goToCart,
                          child: Image.asset(
                            "assets/icons/cart_icon.png",
                            width: screenWidth * 0.1,
                            height: screenHeight * 0.033,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopScrollingNavbar(
                            fontSize: 26,
                            headingText: "All",
                            isSelected: viewModel.selectedItem == "All",
                            onTap: () => viewModel.setSelectedItem("All"),
                          ),
                          const SizedBox(width: 15),
                          TopScrollingNavbar(
                            fontSize: 26,
                            headingText: "Nike",
                            isSelected: viewModel.selectedItem == "Nike",
                            onTap: () => viewModel.setSelectedItem("Nike"),
                          ),
                          const SizedBox(width: 15),
                          TopScrollingNavbar(
                            fontSize: 26,
                            headingText: "Jordan",
                            isSelected: viewModel.selectedItem == "Jordan",
                            onTap: () => viewModel.setSelectedItem("Jordan"),
                          ),
                          const SizedBox(width: 15),
                          TopScrollingNavbar(
                            fontSize: 26,
                            headingText: "Adidas",
                            isSelected: viewModel.selectedItem == "Adidas",
                            onTap: () => viewModel.setSelectedItem("Adidas"),
                          ),
                          const SizedBox(width: 15),
                          TopScrollingNavbar(
                            fontSize: 26,
                            headingText: "Reebok",
                            isSelected: viewModel.selectedItem == "Reebok",
                            onTap: () => viewModel.setSelectedItem("Reebok"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: viewModel.shoesStream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return const Center(child: Text('Error loading shoes'));
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(child: Text('No shoes found'));
                        }
                        final shoes = snapshot.data!.docs;
                        return NotificationListener<UserScrollNotification>(
                          onNotification: (notification) {
                            if (notification.direction == ScrollDirection.forward) {
                              viewModel.showFilterButton();
                            } else if (notification.direction == ScrollDirection.reverse) {
                              viewModel.hideFilterButton();
                            }
                            return true;
                          },
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.62,
                            ),
                            itemCount: shoes.length,
                            itemBuilder: (context, index) {
                              final shoeData = shoes[index].data() as Map<String, dynamic>;
                              final shoeModel = Shoe.fromMap(shoeData);
                              final  rating= viewModel.ratings[shoes[index].id] ?? 0.0;
                              print(rating);
                              return InkWell(
                                onTap: () => viewModel.goToProduct(shoeModel, rating),
                                child: ShoeCard(
                                  shoeName: shoeModel.name,
                                  rating: rating,
                                  price: shoeModel.price,
                                  imageUrl: shoeModel.imageUrl,
                                  reviews: shoeModel.reviews,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20, // Adjust the distance from the bottom
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedOpacity(
                  opacity: viewModel.isFilterButtonVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 100),
                  child: FilterButton(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.fetchRatingsForShoes();
    super.onViewModelReady(viewModel);
  }
}
