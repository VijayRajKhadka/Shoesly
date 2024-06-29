import 'package:flutter/material.dart';
import 'package:shoesly/core/helper/assets_helper.dart';

class CartCard extends StatefulWidget {
  final VoidCallback onDismissed;

  const CartCard({super.key, required this.onDismissed});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Are you sure?"),
              content: Text("Remove this item from cart?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black38),),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Delete", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black38),),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        widget.onDismissed();
      },
      background: Container(
        decoration: const BoxDecoration(
          color: Colors.redAccent,
        ),
      alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:Image.asset(AssetsHelper.trashIcon, width: screenWidth*0.08,)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20, bottom: 0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.23,
                    height: screenHeight * 0.11,
                    child: Image.asset(AssetsHelper.jordanImage),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jordan High Hels Dye Shoes this is gr",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 8),
                        Text("Nike.Red Grey.42", style: TextStyle(color: Colors.grey)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$235.00", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove_circle_outline, size: 25, color: Colors.grey),
                                ),
                                const Text("1", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add_circle_outline_sharp, size: 25),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
