import 'package:flutter/material.dart';
import 'package:shoesly/ui/views/cart_screen/cart_view_model.dart';
import 'package:shoesly/ui/widgets/cart_card.dart';
import 'package:stacked/stacked.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({super.key});

  @override
  Widget builder(BuildContext context, CartViewModel viewModel, Widget? child) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        surfaceTintColor: Colors.white,
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
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: screenHeight,
              color: Colors.white,
              child: Column(
                children: [
                  CartCard(
                  onDismissed: () {
                  },),
                  CartCard(
                    onDismissed: () {
                    },),
                  CartCard(
                    onDismissed: () {
                    },),
                  CartCard(
                    onDismissed: () {
                    },),
                  CartCard(
                    onDismissed: () {
                    },),
                  CartCard(
                    onDismissed: () {
                    },),
                  CartCard(
                    onDismissed: () {
                    },),]
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Grand Total", style: TextStyle(color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "\$705.00", // Replace with actual price from viewModel
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            "CHECK OUT",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
}
