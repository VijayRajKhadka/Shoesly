import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback cardFunction;

  const OptionCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.cardFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: cardFunction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Text(
            subTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
