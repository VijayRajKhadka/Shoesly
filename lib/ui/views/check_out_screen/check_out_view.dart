import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoesly/core/helper/assets_helper.dart';
import 'package:shoesly/ui/views/check_out_screen/check_out_view_model.dart';
import 'package:shoesly/ui/widgets/bottom_bar.dart';
import 'package:shoesly/ui/widgets/option_card.dart';
import 'package:shoesly/ui/widgets/payment_done_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/order_card.dart';

class CheckOutView extends StackedView<CheckOutViewModel> {
  const CheckOutView({super.key});

  @override
  Widget builder(
      BuildContext context, CheckOutViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Order Summary",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
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
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Information",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                OptionCard(
                  title: "Payment Method",
                  subTitle:
                      viewModel.selectedPaymentMethod ?? "Choose a method",
                  cardFunction: () =>
                      _showPaymentMethodDialog(context, viewModel),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 0.2, color: Colors.grey),
                OptionCard(
                  title: "Location",
                  subTitle: viewModel.selectedLocation ?? "Set a location",
                  cardFunction: () =>
                      _showLocationSelectionDialog(context, viewModel),
                ),
                const SizedBox(height: 30),
                const Text("Order Details",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 20),
                StreamBuilder<QuerySnapshot>(
                  stream: viewModel.cartItems,
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
                            return OrderCard(
                                shoeName: cartData['shoe_name'],
                                brand: cartData['brand'],
                                color: cartData['color'],
                                qty: cartData['quantity'],
                                size: cartData['size'],
                                price: cartData['total_price']);
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text("Payment Details",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sub Total",
                        style: TextStyle(color: Colors.black54, fontSize: 14)),
                    StreamBuilder<QuerySnapshot>(
                      stream: viewModel.cartItems,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('Error loading cart'));
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(child: Text('No cart found'));
                        }
                        final cartItems = snapshot.data!.docs;
                        double price = 0;
                        for (var item in cartItems) {
                          price += (item['total_price'] * item['quantity']);
                        }
                        return Text("\$$price",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shipping",
                        style: TextStyle(color: Colors.black54, fontSize: 14)),
                    Text("\$20.00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 0.2, color: Colors.grey),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Order",
                        style: TextStyle(color: Colors.black54, fontSize: 14)),
                    StreamBuilder<QuerySnapshot>(
                      stream: viewModel.cartItems,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('Error loading cart'));
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(child: Text('No cart found'));
                        }
                        final cartItems = snapshot.data!.docs;
                        double price = 0;
                        for (var item in cartItems) {
                          price += (item['total_price'] * item['quantity']);
                        }
                        return Text("\$${price + 20}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: viewModel.cartItems,
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
            double price = 0;
            for (var item in cartItems) {
              price += (item['total_price'] * item['quantity']);
            }
            return BottomBar(
              title: "Grand Total",
              price: price + 20,
              buttonName: "PAYMENT",
              buttonFunction: () async {
                bool doneOrder= false;
                for( var item in cartItems){
                  bool result= await viewModel.placeOrder(
                      brand: item['brand'],
                      color: item['color'],
                      price: item['total_price'],
                      quantity: item['quantity'],
                      shoeName: item['shoe_name'],
                      size: item['size'],
                      location: viewModel.locationEditor.text,
                      paymentMethod: viewModel.selectedPaymentMethod.toString());
                  if(result){
                    doneOrder=true;
                  }else{
                    doneOrder=false;
                    break;
                  }
                }
                if(doneOrder){
                viewModel.deleteCollection();
                await showModalBottomSheet(
                  enableDrag: false,
                  isDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return PaymentDoneBottomSheet();
                  },
                );}

                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to place all Order.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            );
          },
        ),
      ]),
    );
  }

  Future<void> _showPaymentMethodDialog(
      BuildContext context, CheckOutViewModel viewModel) async {
    final selectedPayment = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Select Payment Method",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(height: 0.5, color: Colors.grey, thickness: 0.3),
                ListTile(
                  leading: Image.asset(
                    AssetsHelper.cashOnDeliveryLogo,
                    width: 30,
                    height: 30,
                  ),
                  title: const Text('Cash on Delivery'),
                  onTap: () {
                    Navigator.pop(context, 'Cash on Delivery');
                  },
                ),
                const Divider(height: 0.5, color: Colors.grey, thickness: 0.3),
                ListTile(
                  leading: Image.asset(
                    AssetsHelper.paypalLogo,
                    width: 30,
                    height: 30,
                  ),
                  title: const Text('PayPal'),
                  onTap: () {
                    Navigator.pop(context, 'PayPal');
                  },
                ),
                const Divider(height: 0.5, color: Colors.grey, thickness: 0.3),
                ListTile(
                  leading: Image.asset(
                    AssetsHelper.masterCardLogo,
                    width: 30,
                    height: 30,
                  ),
                  title: const Text('Credit Card'),
                  onTap: () {
                    Navigator.pop(context, 'Credit Card');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (selectedPayment != null) {
      viewModel.setSelectedPaymentMethod(selectedPayment);
    }
  }

  Future<void> _showLocationSelectionDialog(
      BuildContext context, CheckOutViewModel viewModel) async {
    String? selectedLocation = viewModel.selectedLocation;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Set your Location",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(height: 0.5, color: Colors.grey, thickness: 0.3),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: viewModel.locationEditor,
                    decoration: InputDecoration(
                      hintText: 'Enter Location',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      selectedLocation = value;
                    },
                  ),
                ),
                const Divider(height: 0.5, color: Colors.grey, thickness: 0.3),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (selectedLocation != null &&
                          selectedLocation!.isNotEmpty) {
                        Navigator.pop(context, selectedLocation);
                      }
                    },
                    child: const Text(
                      'Set Location',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        viewModel.setSelectedLocation(value);
      }
    });
  }

  @override
  CheckOutViewModel viewModelBuilder(BuildContext context) =>
      CheckOutViewModel();
}
