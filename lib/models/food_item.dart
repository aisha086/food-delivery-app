class FoodItem {
  final int itemID;
  final String itemName;
  final double price;
  final String description;
  final String imageUrl;

  FoodItem({
    required this.itemID,
    required this.itemName,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      itemID: json['prod_id'],
      itemName: json['pro_name']?? '',
      price: (json['pro_rp'])?.toDouble()?? 0.0,
      description: json['pro_desc']?? '',
      imageUrl: json['pro_img']?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prod_id': itemID,
      'pro_name': itemName,
      'pro_rp': price,
      'pro_desc': description,
      'pro_img': imageUrl,
    };
  }
}
