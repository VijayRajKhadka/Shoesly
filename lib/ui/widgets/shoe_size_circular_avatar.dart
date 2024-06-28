import 'package:flutter/material.dart';

class SizeCircleAvatar extends StatelessWidget {
  final int size;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeCircleAvatar({
    Key? key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          width: 40, // Adjust size as needed
          height: 40, // Adjust size as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.black : Colors.black12,
              width: 1.5,
            ),
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: isSelected ? Colors.black : Colors.transparent,
            foregroundColor: isSelected ? Colors.white : Colors.black,
            child: Text(
              size.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
