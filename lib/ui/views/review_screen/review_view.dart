import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/helper/assets_helper.dart';
import 'package:shoesly/ui/views/review_screen/review_view_model.dart';
import 'package:shoesly/ui/widgets/reviews_card.dart';
import 'package:shoesly/ui/widgets/top_scrolling_navbar.dart';
import 'package:stacked/stacked.dart';

class ReviewView extends StackedView<ReviewViewModel> {
  final double rating;
  const ReviewView(this.rating, {super.key});

  @override
  Widget builder(BuildContext context, ReviewViewModel viewModel, Widget? child) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Reviews (1)", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
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
              rating.toString(),
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
                      isSelected: viewModel.selectedItem == 1.0,
                      onTap: () => viewModel.setSelectedItem(1.0),
                    ),
                    const SizedBox(width: 15),
                    TopScrollingNavbar(
                      fontSize: 23,
                      headingText: "5 Stars",
                      isSelected: viewModel.selectedItem == 5.0,
                      onTap: () => viewModel.setSelectedItem(5.0),
                    ),
                    const SizedBox(width: 15),
                    TopScrollingNavbar(
                      fontSize: 23,
                      headingText: "4 Stars",
                      isSelected: viewModel.selectedItem == 4.0,
                      onTap: () => viewModel.setSelectedItem(4.0),
                    ),
                    const SizedBox(width: 15),
                    TopScrollingNavbar(
                      headingText: "3 Stars",
                      fontSize: 23,
                      isSelected: viewModel.selectedItem == 3.0,
                      onTap: () => viewModel.setSelectedItem(3.0),
                    ),
                    const SizedBox(width: 15),
                    TopScrollingNavbar(
                      fontSize: 23,
                      headingText: "2 Stars",
                      isSelected: viewModel.selectedItem == 2.0,
                      onTap: () => viewModel.setSelectedItem(2.0),
                    ),
                    const SizedBox(width: 15),
                    TopScrollingNavbar(
                      fontSize: 23,
                      headingText: "1 Stars",
                      isSelected: viewModel.selectedItem == 1.0,
                      onTap: () => viewModel.setSelectedItem(1.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30), // Adjust height as needed
               Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: viewModel.shoesStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error loading reviews'));
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('No reviews found'));
                      }
                      final reviews = snapshot.data!.docs;
                      final totalReviews = reviews.length;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: reviews.length,
                            itemBuilder: (context, index) {
                              final reviewData = reviews[index].data()
                              as Map<String, dynamic>;
                              return ReviewsCard(
                                userImageUrl: reviewData['user_image'],
                                userName: reviewData['user_name'],
                                review: reviewData['review'],
                                date: (reviewData['reviewd_on'] as Timestamp)
                                    .toDate()
                                    .toString(),
                                shoeRating: rating,
                              );
                            },
                          ),
                        ],
                      );
                    },
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
