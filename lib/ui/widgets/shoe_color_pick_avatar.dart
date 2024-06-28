import 'package:flutter/material.dart';

class ShoeColorPickAvatar extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ShoeColorPickAvatar({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0, right: 10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.black12 : Colors.black12,
                  width: 1.0,
                ),
                color: color,
              ),
            ),
            if (isSelected)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Icon(
                  Icons.check,
                  size: 15,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
