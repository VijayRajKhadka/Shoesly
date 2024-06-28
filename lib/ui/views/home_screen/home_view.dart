import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoesly/ui/views/home_screen/home_view_model.dart';
import 'package:shoesly/ui/widgets/filter_button.dart';
import 'package:shoesly/ui/widgets/shoe_card.dart';
import 'package:shoesly/ui/widgets/top_scrolling_navbar.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(surfaceTintColor: Colors.white,backgroundColor: Colors.white,),
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
                        Image.asset(
                          "assets/icons/cart_icon.png",
                          width: screenWidth * 0.1,
                          height: screenHeight * 0.033,
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
                            headingText: "All",
                            isSelected: viewModel.selectedItem == "All",
                            onTap: () => viewModel.setSelectedItem("All"),
                          ),
                          const SizedBox(width: 15),
                          TopScrollingNavbar(
                            headingText: "Nike",
                            isSelected: viewModel.selectedItem == "Nike",
                            onTap: () => viewModel.setSelectedItem("Nike"),
                          ),
                          const SizedBox(width: 15),
                          TopScrollingNavbar(
                            headingText: "Jordan",
                            isSelected: viewModel.selectedItem == "Jordan",
                            onTap: () => viewModel.setSelectedItem("Jordan"),
                          ),
                          const SizedBox(width: 15),
                          TopScrollingNavbar(
                            headingText: "Adidas",
                            isSelected: viewModel.selectedItem == "Adidas",
                            onTap: () => viewModel.setSelectedItem("Adidas"),
                          ),
                          const SizedBox(width: 15),
                          TopScrollingNavbar(
                            headingText: "Reebok",
                            isSelected: viewModel.selectedItem == "Reebok",
                            onTap: () => viewModel.setSelectedItem("Reebok"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        if (notification.direction == ScrollDirection.forward) {
                          viewModel.showFilterButton();
                        } else if (notification.direction == ScrollDirection.reverse) {
                          viewModel.hideFilterButton();
                        }
                        return true;
                      },
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.62,
                        children: [
                          InkWell(
                            onTap :viewModel.goToProduct,
                            child: ShoeCard(
                              shoeName: "Jordan 1 Retro High Tie Dye",
                              rating: 4.50,
                              price: 256.00,
                              imageUrl: "assets/images/jordan.png",
                              reviews: 1045,
                            ),
                          ),
                          ShoeCard(
                            shoeName: "Jordan 1 Retro High Tie Dye",
                            rating: 4.50,
                            price: 256.00,
                            imageUrl: "assets/images/jordan.png",
                            reviews: 1045,
                          ),
                          ShoeCard(
                            shoeName: "Jordan 1 Retro High Tie Dye",
                            rating: 4.50,
                            price: 256.00,
                            imageUrl: "assets/images/jordan.png",
                            reviews: 1045,
                          ),
                          ShoeCard(
                            shoeName: "Jordan 1 Retro High Tie Dye",
                            rating: 4.50,
                            price: 256.00,
                            imageUrl: "assets/images/jordan.png",
                            reviews: 1045,
                          ),
                          ShoeCard(
                            shoeName: "Jordan 1 Retro High Tie Dye",
                            rating: 4.50,
                            price: 256.00,
                            imageUrl: "assets/images/jordan.png",
                            reviews: 1045,
                          ),
                          ShoeCard(
                            shoeName: "Jordan 1 Retro High Tie Dye",
                            rating: 4.50,
                            price: 256.00,
                            imageUrl: "assets/images/jordan.png",
                            reviews: 1045,
                          ),
                        ],
                      ),
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
                  duration: const Duration(milliseconds: 300),
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
}
