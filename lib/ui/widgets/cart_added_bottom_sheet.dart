import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/app/app.locator.dart';
import 'package:shoesly/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class CartAddedBottomSheet extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  final int qty;
  CartAddedBottomSheet({super.key, required this.qty});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(20), topRight: Radius.circular(20)),
      ),
      width:MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.09,
              decoration: BoxDecoration(
                border: Border.all(width:2, color: Colors.black),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.done, size: 50,color: Colors.grey,),
            ),
            const SizedBox(height: 20,),
            Text("Added to cart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            const SizedBox(height: 15,),
            Text("${qty.toString()} Item Total", style: TextStyle(color: Colors.black54),),
            const SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.06,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: TextButton(
                        onPressed: _navigationService.navigateToHomeView,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black87, padding: const EdgeInsets.all(13), // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "BACK EXPLORE",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.06,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: TextButton(
                        onPressed: (){},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white, padding: const EdgeInsets.all(13), // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "TO CART",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )



          ],
        ),
      ),
    );
    ;
  }
}
