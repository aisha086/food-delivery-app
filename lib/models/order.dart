class Order {
  final int? orderId;
  final int customerId;
  final String orderAddress;
  final String orderStatus;
  final String? orderDate;
  final double orderPrice;

  Order({
    this.orderId,
    required this.customerId,
    required this.orderAddress,
    this.orderDate,
    required this.orderPrice,
    this.orderStatus = 'Order Confirmed',
  });

  // Method to convert OrderModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'C_ID': customerId.toString(),
      'Order_Destination': orderAddress,
      'Order_Status': orderStatus,
      'Order_Price': orderPrice.toString(),
    };
  }

  // Method to create an OrderModel instance from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['Order_ID'] as int,
      customerId: json['C_ID'] as int,
      orderAddress: json['Order_Destination'],
      orderStatus: json['Order_Status'],
      orderDate: json['Order_Date'],
      orderPrice: json['Order_Price'].toDouble(),
    );
  }

}
