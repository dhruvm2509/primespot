class ProductItem {
  String productName = "";
  String productDescription = "";
  int price = 0;
  String category = "";
  int mobileNumber = 0;
  String sellerId = "";
  String imageUrl = "";

  ProductItem(
      {required this.productName,
      required this.productDescription,
      required this.price,
      required this.category,
      required this.mobileNumber,
      required this.sellerId,
      required this.imageUrl});

  // Named constructor
  ProductItem.fromMap(Map<String, dynamic> mapData) {
    this.category = mapData['Category'];
    this.productName = mapData['ProductName'];
    this.productDescription = mapData['ProductDescription'];
    this.mobileNumber = mapData['mobileNumber'];
    this.price = mapData['Price'];
    this.sellerId = mapData['sellerId'];
    this.imageUrl = mapData['imageUrl'];
  }
}
