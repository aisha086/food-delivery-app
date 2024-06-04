import 'package:flutter/material.dart';
import 'package:recipe_app/models/food_item.dart';
import 'package:recipe_app/pages/item_detail.dart';
import 'package:recipe_app/services/api_service.dart';

class FoodGrid extends StatefulWidget {


  const FoodGrid({super.key});

  @override
  State<FoodGrid> createState() => _FoodGridState();
}

class _FoodGridState extends State<FoodGrid> {
  final ApiService apiService = ApiService();

  List<FoodItem> foodItems = [];
  // late FoodItem fooditem = FoodItem(itemID: 0,itemName: "", price: 0, description: "", imageUrl: "");

  @override
  void initState() {
    super.initState();
    getFoodItems();
  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: size.width / 2
          ),
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return foodItem(context,foodItems[index],size);
          }),
    );
  }

  foodItem(BuildContext context, FoodItem item, Size size){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ItemDetail(item: item)));
      },
      child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  height: size.width/3.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(item.imageUrl),
                          fit: BoxFit.cover))
                  ),
              Text(
                item.itemName,
                style: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
              Text(
                "Price: ${item.price.toString()} Rs.",
                style: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
            ],
          )),
    );
  }

  getFoodItems() async{
    foodItems = await apiService.fetchItems();
    setState(() {});
  }
}

