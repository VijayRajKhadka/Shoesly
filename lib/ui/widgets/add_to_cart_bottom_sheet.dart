import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/shoe_model.dart';
import 'cart_added_bottom_sheet.dart';

class AddToCartBottomSheet extends StatefulWidget {
  final double price;



  const AddToCartBottomSheet({super.key, required this.price });

  @override
  _AddToCartBottomSheetState createState() => _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  int quantity = 1;
  late TextEditingController _controller;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: quantity.toString());
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
      _controller.text = quantity.toString();
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        _controller.text = quantity.toString();
      });
    }
  }

  void updateQuantity(String value) {
    if (value.isEmpty) {
      // Allow empty field and set quantity to 0 or handle it as you prefer
      setState(() {
        quantity = 0;
      });
    } else {
      int? newQuantity = int.tryParse(value);
      if (newQuantity != null && newQuantity > 0) {
        setState(() {
          quantity = newQuantity;
        });
      } else {
        // If the new quantity is not valid, reset the TextField to the current quantity
        _controller.text = quantity.toString();
      }

    }



  }
  Future<bool> addToCart({
    required String brand,
    required String color,
    required double price,
    required int quantity,
    required String shoeName,
    required int size,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('cart').add({
        'brand': brand,
        'color': color,
        'total_price': price,
        'quantity': quantity,
        'shoe_name': shoeName,
        'size': size,
      });
      return true; // Success
    } catch (e) {
      print('Error adding to cart: $e');
      return false; // Failure
    }
  }
  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.price * quantity;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10, bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.003,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add to cart',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Quantity',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.83,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end, // Aligns the icons to the end of the Row
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: decrementQuantity,
                                icon: Icon(Icons.remove_circle_outline_sharp, size: 28, color: Colors.grey),
                              ),
                              IconButton(
                                onPressed: incrementQuantity,
                                icon: Icon(Icons.add_circle_outline_sharp, size: 28, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                      onChanged: updateQuantity, // Update quantity on change
                    ),

                  ),

                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Total Price',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      Navigator.of(context).pop({"quantity": quantity, "totalPrice": totalPrice});

                    },
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
                        "ADD TO CART",
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
    );
  }
}
