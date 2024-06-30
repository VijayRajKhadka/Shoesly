import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String shoeName;
  final String brand;
  final int size;
  final String color;
  final int qty;

  const OrderCard({super.key, required this.shoeName, required this.brand, required this.color, required this.qty, required this.size});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(shoeName, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$brand. $color. $size. Qty $qty", style: TextStyle(color: Colors.black45),),
              Text("\$235.00", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

            ],
          )
        ],
      ),
    );
  }
}
