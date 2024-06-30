import 'package:flutter/material.dart';
import 'package:shoesly/core/helper/assets_helper.dart';
import 'package:shoesly/ui/views/review_screen/review_view_model.dart';
import 'package:shoesly/ui/widgets/reviews_card.dart';
import 'package:shoesly/ui/widgets/top_scrolling_navbar.dart';
import 'package:stacked/stacked.dart';

class ReviewView extends StackedView<ReviewViewModel> {
  const ReviewView({super.key});

  @override
  Widget builder(BuildContext context, ReviewViewModel viewModel, Widget? child) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Reviews (1045)", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            iconSize: 25,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Icon(Icons.star_rate_rounded, color: Colors.orangeAccent, size: 20),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              "4.5",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        height: screenHeight,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopScrollingNavbar(
                      fontSize: 23,
                      headingText: "All",
                      isSelected: viewModel.selectedItem == "All",
                      onTap: () => viewModel.setSelectedItem("All"),
                    ),
                    const SizedBox(width: 15),
                    TopScrollingNavbar(
                      fontSize: 23,
                      headingText: "5 Stars",
                      isSelected: viewModel.selectedItem == "5 Stars",
                      onTap: () => viewModel.setSelectedItem("5 Stars"),
                    ),
                    const SizedBox(width: 15),
                    TopScrollingNavbar(
                      fontSize: 23,
                      headingText: "4 Stars",
                      isSelected: viewModel.selectedItem == "4 Stars",
                      onTap: () => viewModel.setSelectedItem("4 Stars"),
                    ),
                    const SizedBox(width: 15),
                    TopScrollingNavbar(
                      headingText: "3 Stars",
                      fontSize: 23,
                      isSelected: viewModel.selectedItem == "3 Stars",
                      onTap: () => viewModel.setSelectedItem("3 Stars"),
                    ),
                    const SizedBox(width: 15),
                    TopScrollingNavbar(
                      fontSize: 23,
                      headingText: "2 Stars",
                      isSelected: viewModel.selectedItem == "2 Stars",
                      onTap: () => viewModel.setSelectedItem("2 Stars"),
                    ),
                    const SizedBox(width: 15),
                    TopScrollingNavbar(
                      fontSize: 23,
                      headingText: "1 Stars",
                      isSelected: viewModel.selectedItem == "1 Stars",
                      onTap: () => viewModel.setSelectedItem("1 Stars"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30), // Adjust height as needed
              const Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ReviewsCard(
                        userImageUrl: AssetsHelper.user1,
                        userName: "Nolan Carder",
                        review: "Perfect for keeping your feet dry and warm in damp conditions",
                        date: "Today",
                      ),
                      ReviewsCard(
                        userImageUrl: AssetsHelper.user1,
                        userName: "Nolan Carder",
                        review: "Perfect for keeping your feet dry and warm in damp conditions",
                        date: "Today",
                      ),
                      ReviewsCard(
                        userImageUrl: AssetsHelper.user1,
                        userName: "Nolan Carder",
                        review: "Perfect for keeping your feet dry and warm in damp conditions",
                        date: "Today",
                      ),
                      ReviewsCard(
                        userImageUrl: AssetsHelper.user1,
                        userName: "Nolan Carder",
                        review: "Perfect for keeping your feet dry and warm in damp conditions",
                        date: "Today",
                      ),
                      ReviewsCard(
                        userImageUrl: AssetsHelper.user1,
                        userName: "Nolan Carder",
                        review: "Perfect for keeping your feet dry and warm in damp conditions",
                        date: "Today",
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ReviewViewModel viewModelBuilder(BuildContext context) => ReviewViewModel();
}
