import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String title;
  final double price;
  final String buttonName;
  final VoidCallback buttonFunction;

  const BottomBar({
    super.key,
    required this.title,
    required this.price,
    required this.buttonName, required this.buttonFunction,

  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${price.toStringAsFixed(2)}", // Format price with two decimal places
                  style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: buttonFunction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      buttonName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
