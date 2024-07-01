import 'package:flutter/material.dart';
import 'package:shoesly/core/helper/date_time_helper.dart';

class ReviewsCard extends StatelessWidget {
  final String userImageUrl;
  final String userName;
  final String review;
  final String date;
  final double shoeRating;

  const ReviewsCard({super.key, required this.userImageUrl, required this.userName, required this.review, required this.date, required this.shoeRating});

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
          const SizedBox(width: 15),
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
                Row(
                  children: [
                    // Loop through a fixed number of total stars
                    for (int i = 1; i <= 5; i++)
                      Icon(
                        // Using conditional logic to determine the star color
                        i <= shoeRating
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        size: 20,
                        color: i <= shoeRating
                            ? Colors.orangeAccent
                            : Colors.black12,
                      ),

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
