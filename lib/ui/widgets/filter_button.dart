import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth*0.34,
      child: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Adjust as needed for roundness
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/icons/filter_icon.png", width: screenWidth*0.07,),
              Text("FILTER", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),)
            ],
          ),
        ),

      ),
    );
  }
}
