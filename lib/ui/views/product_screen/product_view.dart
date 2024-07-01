import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/helper/assets_helper.dart';
import 'package:shoesly/ui/views/product_screen/product_view_model.dart';
import 'package:shoesly/ui/widgets/add_to_cart_bottom_sheet.dart';
import 'package:shoesly/ui/widgets/bottom_bar.dart';
import 'package:shoesly/ui/widgets/cart_added_bottom_sheet.dart';
import 'package:shoesly/ui/widgets/reviews_card.dart';
import 'package:stacked/stacked.dart';

import '../../../model/shoe_model.dart';
import '../../widgets/see_all_review_button.dart';
import '../../widgets/shoe_color_pick_avatar.dart';
import '../../widgets/shoe_size_circular_avatar.dart';

class ProductView extends StackedView<ProductViewModel> {
  final Shoe shoeModel;
  final double shoeRating;

  const ProductView(this.shoeRating, {super.key, required this.shoeModel});

  Future<bool> addToCart({
    required String brand,
    required String color,
    required double price,
    required int quantity,
    required String shoeName,
    required int size,
    required String imageName,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('cart').add({
        'brand': brand,
        'color': color,
        'total_price': price,
        'quantity': quantity,
        'shoe_name': shoeName,
        'size': size,
        'imageName': imageName
      });
      return true; // Success
    } catch (e) {
      print('Error adding to cart: $e');
      return false; // Failure
    }
  }

  @override
  Widget builder(
      BuildContext context, ProductViewModel viewModel, Widget? child) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          InkWell(
            onTap: viewModel.goToCart,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Image.asset(
                "assets/icons/cart_bag_icon.png",
                width: screenWidth * 0.1,
                height: screenHeight * 0.028,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.white54,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.38,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/${shoeModel.imageUrl}",
                                width: screenWidth,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ShoeColorPickAvatar(
                                    color: Colors.white,
                                    isSelected:
                                        viewModel.selectedColor == "White",
                                    onTap: () =>
                                        viewModel.selectColor("White"),
                                  ),
                                  ShoeColorPickAvatar(
                                    color: Colors.black,
                                    isSelected:
                                        viewModel.selectedColor == "Black",
                                    onTap: () =>
                                        viewModel.selectColor("Black"),
                                  ),
                                  ShoeColorPickAvatar(
                                    color: Colors.green,
                                    isSelected:
                                        viewModel.selectedColor == "Green",
                                    onTap: () =>
                                        viewModel.selectColor("Green"),
                                  ),
                                  ShoeColorPickAvatar(
                                    color: Colors.blueAccent,
                                    isSelected: viewModel.selectedColor =="Blue",
                                    onTap: () => viewModel
                                        .selectColor("Blue"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        shoeModel.name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 19),
                      ),
                    ),
                    Row(
                      children: [
                        // Loop through a fixed number of total stars (5 in this case)
                        for (int i = 1; i <= 5; i++)
                          Icon(
                            // Use conditional logic to determine the star color (filled or empty)
                            i <= shoeRating
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            size: 20,
                            color: i <= shoeRating
                                ? Colors.orangeAccent
                                : Colors.black12,
                          ),
                        const SizedBox(width: 5),
                        Text(
                          shoeRating.toString(),
                          // Display the actual rating value
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "(${shoeModel.rating.toString()} Reviews)",
                          // Display the number of reviews
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Size",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        children: [
                          SizeCircleAvatar(
                            size: 39,
                            isSelected: viewModel.selectedSize == 39,
                            onTap: () => viewModel.setSize(39),
                          ),
                          SizeCircleAvatar(
                            size: 40,
                            isSelected: viewModel.selectedSize == 40,
                            onTap: () => viewModel.setSize(40),
                          ),
                          SizeCircleAvatar(
                            size: 41,
                            isSelected: viewModel.selectedSize == 41,
                            onTap: () => viewModel.setSize(41),
                          ),
                          SizeCircleAvatar(
                            size: 42,
                            isSelected: viewModel.selectedSize == 42,
                            onTap: () => viewModel.setSize(42),
                          ),
                          SizeCircleAvatar(
                            size: 43,
                            isSelected: viewModel.selectedSize == 43,
                            onTap: () => viewModel.setSize(43),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black87),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        shoeModel.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: viewModel.topRatedReviewsStream,
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Reviews ($totalReviews)",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black87),
                              ),
                            ),
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
                                  shoeRating: shoeRating,
                                );
                              },
                            ),
                            SeeAllReviewButton(
                              onPressed: () {
                                viewModel.seeAllReviews(shoeRating);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 140,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomBar(
            title: "Price",
            price: shoeModel.price,
            buttonName: "ADD TO CART",
            buttonFunction: () async {
              var result = await showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return AddToCartBottomSheet(price: shoeModel.price);
                },
              );

              if (result != null && result is Map<String, dynamic>) {
                bool addToCartResult = await addToCart(
                  brand: shoeModel.brand,
                  color: viewModel.selectedColor,
                  price: shoeModel.price,
                  quantity: result['quantity'],
                  shoeName: shoeModel.name,
                  size: viewModel.selectedSize,
                  imageName: shoeModel.imageUrl,
                );
                print(addToCartResult);
                if (addToCartResult) {
                  showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {return CartAddedBottomSheet(qty: result['quantity']);},
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to add to cart.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Cancelled or error in bottom sheet.'),
                    backgroundColor: Colors.grey,
                  ),
                );
              }
            },
          ),

        ],
      ),
    );
  }

  @override
  ProductViewModel viewModelBuilder(BuildContext context) => ProductViewModel();
}
