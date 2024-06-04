import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/models/food_item.dart';
import 'package:recipe_app/widgets/cart_widgets/add_to_cart.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({super.key, required this.item});
  final FoodItem item;

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int quantityCount = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),

              child: ListView(children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30),
                  height: size.height / 2.4,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(widget.item.imageUrl),
                          fit: BoxFit.cover)),
                ),
                Text(widget.item.itemName,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 30)),
                const Text(
                  "Description",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  widget.item.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 14, height: 2),
                ),
              ]),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Theme.of(context).primaryColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.item.price.toString()} PKR",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        changeQuantityIcon(isUp: true),
                        Text(
                          quantityCount.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        changeQuantityIcon(isUp: false)
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                AddToCartButton(
                    currItem: widget.item, quantityCount: quantityCount)
              ],
            ),
          )
        ],
      ),
    );
  }

  changeQuantityIcon({required bool isUp}) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
    color: Theme.of(context).cardColor,
        shape: BoxShape.circle,
          ),
      child: IconButton(
        onPressed: () {
          if (isUp) {
            setState(() {
              quantityCount++;
            });
          } else {
            if (quantityCount > 0) {
              setState(() {
                quantityCount--;
              });
            }
          }
        },
        icon: Icon(
          isUp ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
