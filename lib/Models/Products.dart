class Products {
  String productName = "";
  String productDescription = "";
  int price = 0;
  String category = "";
  int mobileNumber = 0;

  Products({
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.category,
    required this.mobileNumber,
  });

  Map toMap(Products products) {
    var data = Map<String, dynamic>();
    data['ProductName'] = products.productName;
    data['ProductDescription'] = products.productDescription;
    data['Price'] = products.price;
    data['Category'] = products.category;
    data['mobileNumber'] = products.mobileNumber;
    return data;
  }

  // Named constructor
  Products.fromMap(Map<String, dynamic> mapData) {
    this.category = mapData['Category'];
    this.productName = mapData['ProductName'];
    this.productDescription = mapData['ProductDescription'];
    this.mobileNumber = mapData['mobileNumber'];
    this.price = mapData['Price'];
  }
}
