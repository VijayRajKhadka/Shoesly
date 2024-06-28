import 'package:flutter/material.dart';

class TopScrollingNavbar extends StatelessWidget {
  final String headingText;
  final bool isSelected;
  final VoidCallback onTap;

  const TopScrollingNavbar({
    Key? key,
    required this.headingText,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Text(
        headingText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
