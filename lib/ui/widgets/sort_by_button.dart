import 'package:flutter/material.dart';

class SortByButton extends StatelessWidget {
  final bool selected;
  final VoidCallback buttonFunction;
  final String buttonText;

  const SortByButton({
    super.key,
    required this.selected,
    required this.buttonFunction,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.05,
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: ElevatedButton.styleFrom(
          foregroundColor: selected ? Colors.white : Colors.black, backgroundColor: selected ? Colors.black : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: const BorderSide(color: Colors.grey)
          ),
          // Use MaterialStateProperty.resolveWith to handle different button states

        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
