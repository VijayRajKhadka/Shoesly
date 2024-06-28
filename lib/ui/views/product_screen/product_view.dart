import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/helper/assets_helper.dart';
import 'package:shoesly/ui/views/product_screen/product_view_model.dart';
import 'package:shoesly/ui/widgets/reviews_card.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/see_all_review_button.dart';
import '../../widgets/shoe_color_pick_avatar.dart';
import '../../widgets/shoe_size_circular_avatar.dart';

class ProductView extends StackedView<ProductViewModel>{
  const ProductView({super.key});

  @override
  Widget builder(BuildContext context, ProductViewModel viewModel, Widget? child) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
   return Scaffold(
     appBar: AppBar(
       surfaceTintColor: Colors.white,
       backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: IconButton(
            icon:  const Icon(Icons.arrow_back_sharp), iconSize: 25, onPressed: () { Navigator.of(context).pop();
        },

          ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Image.asset("assets/icons/cart_bag_icon.png",width: screenWidth*0.1,height: screenHeight*0.028, ),
        )
      ],
     ),
     body: Stack(

       children: [
         SingleChildScrollView(
           child: Container(
             color: Colors.white54,
             child: Padding(
               padding: const EdgeInsets.only(left: 30.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 SizedBox(
                 width: screenWidth * 0.85,
                 height: screenHeight * 0.38,
                 child: Stack(
                   children: [
                     Image.asset(
                       AssetsHelper.jordanImage,
                       fit: BoxFit.fill,
                     ),
                     Positioned(
                       bottom: 10,
                       right: 20,
                       child: Container(
                         padding: const EdgeInsets.all(8), // Adjust padding as needed
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(30),
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             ShoeColorPickAvatar(
                               color: Colors.white,
                               isSelected: viewModel.selectedColor == Colors.white,
                               onTap: () => viewModel.selectColor(Colors.white),
                             ),
                             ShoeColorPickAvatar(
                               color: Colors.black,
                               isSelected: viewModel.selectedColor == Colors.black,
                               onTap: () => viewModel.selectColor(Colors.black),
                             ),
                             ShoeColorPickAvatar(
                               color: Colors.green,
                               isSelected: viewModel.selectedColor == Colors.green,
                               onTap: () => viewModel.selectColor(Colors.green),
                             ),
                             ShoeColorPickAvatar(
                               color: Colors.blueAccent,
                               isSelected: viewModel.selectedColor == Colors.blueAccent,
                               onTap: () => viewModel.selectColor(Colors.blueAccent),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),


                 const Padding(
                     padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                     child: Text("Jordan 1 Retro High Tie Dye", style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: 19),),
                   ),
                   const Row(
                     children: [
                       Icon(Icons.star_rounded, size: 20, color: Colors.orangeAccent,),
                       Icon(Icons.star_rounded, size: 20, color: Colors.orangeAccent,),
                       Icon(Icons.star_rounded, size: 20, color: Colors.orangeAccent,),
                       Icon(Icons.star_rounded, size: 20, color: Colors.orangeAccent,),
                       Icon(Icons.star_rounded, size: 20, color: Colors.black12,),
                       SizedBox(width: 5,),
                       Text("4.5", style: TextStyle(fontWeight: FontWeight.bold),),
                       SizedBox(width: 5,),
                       Text("(1045 Reviews)", style: TextStyle(color: Colors.grey),)
                     ],
                   ),
                   const SizedBox(height: 20,),

                   const Text("Size", style: TextStyle(fontWeight: FontWeight.w500 ,fontSize: 18, color: Colors.black87),),

                   Padding(
                     padding: const EdgeInsets.only(top:10.0, bottom: 10.0),
                     child: Row(
                       children: [
                         SizeCircleAvatar(
                           size: 39,
                           isSelected: viewModel.selectedSize == 39,
                           onTap: () => viewModel.setSize(39),
                         ),
                         SizeCircleAvatar(
                           size: 40,
                           isSelected: viewModel.selectedSize == 40,
                           onTap: () => viewModel.setSize(40),
                         ),
                         SizeCircleAvatar(
                           size: 41,
                           isSelected: viewModel.selectedSize == 41,
                           onTap: () => viewModel.setSize(41),
                         ),
                         SizeCircleAvatar(
                           size: 42,
                           isSelected: viewModel.selectedSize == 42,
                           onTap: () => viewModel.setSize(42),
                         ),
                         SizeCircleAvatar(
                           size: 43,
                           isSelected: viewModel.selectedSize == 43,
                           onTap: () => viewModel.setSize(43),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(height: 20,),

                   const Padding(
                     padding: EdgeInsets.only(bottom: 8.0),
                     child: Text("Description", style: TextStyle(fontWeight: FontWeight.w500 ,fontSize: 18, color: Colors.black87),),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 30),
                     child: Text("Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloudl sneaker with cutting-edge technologies for a pair",textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.w400 ,fontSize: 16, color: Colors.grey),),
                   ),

                   const SizedBox(height: 20,),

                   const Padding(
                     padding: EdgeInsets.only(bottom: 8.0),
                     child: Text("Reviews (1045)", style: TextStyle(fontWeight: FontWeight.w500 ,fontSize: 18, color: Colors.black87),),
                   ),
                   const SizedBox(height: 10,),
                   ReviewsCard(userImageUrl: AssetsHelper.user1, userName: "Nolan Carder", review: "Perfect for keeping your feet dry and warm in damp conditions", date: "Today",),
                   ReviewsCard(userImageUrl: AssetsHelper.user1, userName: "Nolan Carder", review: "Perfect for keeping your feet dry and warm in damp conditions", date: "Today",),
                   ReviewsCard(userImageUrl: AssetsHelper.user1, userName: "Nolan Carder", review: "Perfect for keeping your feet dry and warm in damp conditions", date: "Today",),

                   SeeAllReviewButton(onPressed: ()=>viewModel.seeAllReviews,),

                   const SizedBox(height: 140,),
                 ],
               ),
             ),
           ),
         ),
         Positioned(
           left: 0,
           right: 0,
           bottom: 0,
           child: Container(
             color: Colors.white,
             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text("Price",style: TextStyle(color: Colors.grey),),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text(
                       "\$235.00", // Replace with actual price from viewModel
                       style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                     ),
                     ElevatedButton(
                       onLongPress: (){
                         print("ok");
                       },
                       onPressed: () {
                         print("Hello");

                       viewModel.addToCart;},
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.black,
                         elevation: 0,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30),
                         ),
                       ),
                       child: const Padding(
                         padding: EdgeInsets.all(18.0),
                         child: Text(
                           "ADD TO CART",
                           style: TextStyle(color: Colors.white),
                         ),
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
   );

  }

  @override
  ProductViewModel viewModelBuilder(BuildContext context)=> ProductViewModel();

}