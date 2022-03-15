# PrimeSpot

Prime Spot is a one-stop solution for all our daily shopping needs. With this app, one can buy their daily essentials (like grocery items, Mobile Accessories, Stationaries, Medicines) within their city. 
Clone the project through this link:
   * For Mobile App:  https://github.com/dhruvm2509/Primespot

## Getting Started


Prime Spot has 2 Interfaces to users:
   * First one for Buyers who wants to buy products within their city range and Second one for Sellers who wants to sell their products within their city. 
   * This app will provide benefits to local Shopkeepers to grow their business. They can register their products and can sell it throughout their city range. And the customers within their city can buy and will get the product delivered within short duration of time (couple of Hours).
   * We are authenticating users through mobile number and OTP(One Time Password) as OTP is more secure form of authentication. 
   * If the user is Buyer, then after logging in, He/she can find various products that are uploaded by different Sellers within their city. If they find the product useful and wants to buy the product then they can see the Seller’s contact and can get direction to the Seller’s Shop if home Delivery isn’t available after payment. If Buyer wants to save that product for future, he/she can add that to their Wishlist and can purchase that product later.
   * If the user is Seller, then after logging in, He/she can add their products which they want to sell within their city and can edit/delete their already added products. If a Buyer buys their products then they will receive notification regarding the details and address of the buyer and can deliver the product using google maps direction which is embedded in our app using Google Maps API.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:
```
https://github.com/dhruvm2509/primespot.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```
**Step 3:**

After it run this command:
  ```
  flutter run
  ```
  
  Tools & modules Used:
  - Flutter 
  - FireBase (for backend and database)
  - Google_maps_flutter
  - razorpay_flutter
  - url_launcher
  - geolocator
  - flutter_polyline_points
  - cloud_firestore
  - geocoding
  - flutter_google_places
  - geo_firestore_flutter
  
  
  ![Login](https://github.com/dhruvm2509/primespot/blob/main/Images/Login.jpg)![OTP](https://github.com/dhruvm2509/primespot/blob/main/Images/OTP.jpg)|  ![OTP2](https://github.com/dhruvm2509/primespot/blob/main/Images/OTP2.jpg)|  ![dashboard](https://github.com/dhruvm2509/primespot/blob/main/Images/Dashboard.jpg)|  ![Categories1](https://github.com/dhruvm2509/primespot/blob/main/Images/Categories1.jpg)|  ![ Categories2](https://github.com/dhruvm2509/primespot/blob/main/Images/Categories2.jpg)|  ![Details](https://github.com/dhruvm2509/primespot/blob/main/Images/Product_Details.jpg)|  ![Buy](https://github.com/dhruvm2509/primespot/blob/main/Images/Buy.jpg)|  ![Directions](https://github.com/dhruvm2509/primespot/blob/main/Images/Directions.jpg)|  ![Wishlist](https://github.com/dhruvm2509/primespot/blob/main/Images/Wishlist.jpg)|  ![Seller_Dashboard](https://github.com/dhruvm2509/primespot/blob/main/Images/Seller_Dashboard.jpg)|  ![Edit_Product](https://github.com/dhruvm2509/primespot/blob/main/Images/Edit_Product.jpg)|  ![Notifications](https://github.com/dhruvm2509/primespot/blob/main/Images/Notifications.jpg)|
