import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: Text("Cart",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
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
              child: StreamBuilder<QuerySnapshot>(
                stream: viewModel.cart,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error loading cart'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No item found'));
                  }
                  final cartItems = snapshot.data!.docs;
                  final totalCart = cartItems.length;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final cartData =
                              cartItems[index].data() as Map<String, dynamic>;
                          return CartCard(
                            onDismissed: () {},
                            brand: cartData['brand'],
                            color: cartData['color'],
                            quantity: cartData['quantity'],
                            shoeName: cartData['shoe_name'],
                            shoeSize: cartData['size'],
                            totalPrice: cartData['total_price'],
                            imageName: cartData['imageName'],
                            reduceQuantity: () {
                              if (cartData['quantity'] > 1) {
                                int newQuantity = cartData['quantity'] - 1;
                                viewModel.updateQuantity(
                                    cartItemId: cartItems[index].id,
                                    newQuantity: newQuantity);
                              }
                            },
                            addQuantity: () {
                              int newQuantity = cartData['quantity'] + 1;
                              viewModel.updateQuantity(
                                  cartItemId: cartItems[index].id,
                                  newQuantity: newQuantity);
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: viewModel.cart,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error loading cart'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No item found'));
              }
              final cartItems = snapshot.data!.docs;
              final totalCart = cartItems.length;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartData =
                      cartItems[index].data() as Map<String, dynamic>;
                      return CartCard(
                        onDismissed: () {},
                        brand: cartData['brand'],
                        color: cartData['color'],
                        quantity: cartData['quantity'],
                        shoeName: cartData['shoe_name'],
                        shoeSize: cartData['size'],
                        totalPrice: cartData['total_price'],
                        imageName: cartData['imageName'],
                        reduceQuantity: () {
                          if (cartData['quantity'] > 1) {
                            int newQuantity = cartData['quantity'] - 1;
                            viewModel.updateQuantity(
                                cartItemId: cartItems[index].id,
                                newQuantity: newQuantity);
                          }
                        },
                        addQuantity: () {
                          int newQuantity = cartData['quantity'] + 1;
                          viewModel.updateQuantity(
                              cartItemId: cartItems[index].id,
                              newQuantity: newQuantity);
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
          StreamBuilder<QuerySnapshot>(
            stream: viewModel.cart,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error loading cart'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No cart found'));
              }
              final cartItems = snapshot.data!.docs;
              double price =0;
              for (var item in cartItems){
              price+= (item['total_price']*item['quantity']);
              }
              return BottomBar(
                title: 'Grand Total',
                price: price,
                buttonName: 'CHECK OUT',
                buttonFunction: () {
                  viewModel.goToCheckOut();
                },
              );
            },
          ),

        ],
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
}
