import 'package:flutter/material.dart';
import 'package:shoesly/ui/views/cart_screen/cart_view_model.dart';
import 'package:shoesly/ui/widgets/bottom_bar.dart';
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
                  
                  ]
              ),
            ),
          ),
           BottomBar(title: 'Grand Total', price: 705.00, buttonName: 'CHECK OUT', buttonFunction: () { viewModel.goToCheckOut(); },)
        ],
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
}
