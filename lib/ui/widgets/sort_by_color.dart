import 'package:flutter/material.dart';

class SortByColor extends StatelessWidget {
  final bool selected;
  final VoidCallback buttonFunction;
  final String colorText;
  final Color color;

  const SortByColor({
    super.key,
    required this.selected,
    required this.buttonFunction,
    required this.colorText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.05,
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: selected ? color : Colors.black12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey), // Border color for the circle
                color: color, // Circle color
              ),
            ),
            SizedBox(width: 10),
            Text(
              colorText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
