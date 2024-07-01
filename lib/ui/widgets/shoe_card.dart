

import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoeCard extends StatelessWidget {
  final String shoeName;
  final double rating;
  final double price;
  final String imageUrl;
  final int reviews;
  const ShoeCard({super.key, required this.shoeName, required this.rating, required this.price, required this.imageUrl, required this.reviews});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth*1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: Image.asset(
                  width: screenWidth*0.4,
                  "assets/images/$imageUrl",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),

          Text(shoeName, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),  maxLines: 1, overflow: TextOverflow.ellipsis, ),
          const SizedBox(height: 8,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.star_rounded, color: Colors.orangeAccent,size: 20,),
              const SizedBox(width: 2,),

              Text(rating.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              const SizedBox(width: 5,),

              Text("(2 Reviews)", style: TextStyle(color: Colors.grey, fontSize: 14),)
            ],

          ),
          const SizedBox(height: 3,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.attach_money_sharp),
              Text(price.toString(),style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),),
            ],
          ),

        ],
      ),
    );
  }
}
