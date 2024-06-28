import 'package:flutter/material.dart';

class SeeAllReviewButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SeeAllReviewButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.86,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.07,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black12),
          ),
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: Colors.black87, padding: const EdgeInsets.all(13), // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "SEE ALL REVIEWS",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
