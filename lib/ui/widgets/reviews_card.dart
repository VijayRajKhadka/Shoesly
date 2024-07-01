import 'package:flutter/material.dart';
import 'package:shoesly/core/helper/assets_helper.dart';
import 'package:shoesly/core/helper/date_time_helper.dart';

class ReviewsCard extends StatelessWidget {
  final String userImageUrl;
  final String userName;
  final String review;
  final String date;

  const ReviewsCard({Key? key, required this.userImageUrl, required this.userName, required this.review, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            child: Image.asset("assets/images/$userImageUrl"),
          ),
          const SizedBox(width: 15), // Add space between CircleAvatar and Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(DateTimeHelper.timeAgo(date), style: const TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.star_rounded, size: 20, color: Colors.orangeAccent),
                    Icon(Icons.star_rounded, size: 20, color: Colors.orangeAccent),
                    Icon(Icons.star_rounded, size: 20, color: Colors.orangeAccent),
                    Icon(Icons.star_rounded, size: 20, color: Colors.orangeAccent),
                    Icon(Icons.star_rounded, size: 20, color: Colors.orangeAccent),
                  ],
                ),
                const SizedBox(height: 5), // Add space between rating and description
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, bottom: 25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.72, // Adjust width as needed
                    child:  Text(
                      review,
                      style: const TextStyle(color: Colors.black87, fontSize:15, fontWeight: FontWeight.w400 ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
