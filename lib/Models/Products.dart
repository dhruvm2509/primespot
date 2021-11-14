class Products {
  String productName = "";
  String productDescription = "";
  String price = "";
  String category = "";
  String mobileNumber = "";
  String imageUrl = "";

  Products(
      {required this.productName,
      required this.productDescription,
      required this.price,
      required this.category,
      required this.mobileNumber,
      required this.imageUrl});

  Map toMap(Products products) {
    var data = Map<String, dynamic>();
    data['ProductName'] = products.productName;
    data['ProductDescription'] = products.productDescription;
    data['Price'] = products.price;
    data['Category'] = products.category;
    data['mobileNumber'] = products.mobileNumber;
    data['imageUrl'] = products.imageUrl;
    return data;
  }

  // Named constructor
  Products.fromMap(Map<String, dynamic> mapData) {
    this.category = mapData['Category'];
    this.productName = mapData['ProductName'];
    this.productDescription = mapData['ProductDescription'];
    this.mobileNumber = mapData['mobileNumber'];
    this.price = mapData['Price'];
    this.imageUrl = mapData['imageUrl'];
  }
}
