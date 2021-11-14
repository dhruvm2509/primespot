class NotificationItem {
  String productName = "";
  String productDescription = "";
  String price = "";
  String category = "";
  String mobileNumber = "";
  String buyerId = "";
  String imageUrl = "";
  String message = "";
  String buyerName = "";

  NotificationItem(
      {required this.productName,
      required this.productDescription,
      required this.price,
      required this.category,
      required this.mobileNumber,
      required this.buyerId,
      required this.imageUrl,
      required this.message,
      required this.buyerName});

  // Named constructor
  NotificationItem.fromMap(Map<String, dynamic> mapData) {
    this.category = mapData['Category'];
    this.productName = mapData['ProductName'];
    this.productDescription = mapData['ProductDescription'];
    this.mobileNumber = mapData['mobileNumber'];
    this.price = mapData['Price'];
    this.buyerId = mapData['buyerId'];
    this.imageUrl = mapData['imageUrl'];
    this.message = mapData['Message'];
    this.buyerName = mapData['BuyerName'];
  }
}
