import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:primespot/product_details/product_details.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  final List<String> imagesList = [
    'https://cdn.shopify.com/s/files/1/1916/9825/files/ele.mobile_accessries_2048x2048.jpg?v=1621587344',
    'https://uidesign.gbtcdn.com/GB/image/2019/20190802_11705/banner.jpg?imbypass=true',
    'https://media-eng.dhakatribune.com/uploads/2018/07/samsung-accessories-edited-1532008683956.jpg',
    'https://images.dailyobjects.com/marche/assets/images/homepage/desktop/cases-banner-desktop-update.jpg?tr=cm-pad_crop,w-412,dpr-2',
    'https://zapvi.in/wp-content/uploads/2021/03/2.png',
  ];

  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            'Mobile Accessories',
            style: TextStyle(
                letterSpacing: 1.6,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
            items: imagesList
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: EdgeInsets.only(
                        top: 10.0,
                        bottom: 0.0,
                      ),
                      elevation: 6.0,
                      shadowColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              item,
                              fit: BoxFit.fill,
                              height: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesList.map((urlOfItem) {
              int index = imagesList.indexOf(urlOfItem);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Color.fromRGBO(0, 0, 0, 0.8)
                      : Color.fromRGBO(0, 0, 0, 0.3),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200.0),
            child: Text(
              'Best Sellers',
              style: TextStyle(
                  fontSize: 23.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(right: 180.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product_details()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://i.guim.co.uk/img/media/b5e472b808412cac4de1295aec1a7f31a5e507bc/519_118_3793_2276/master/3793.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=8ab8c57927e131b66aa68d0a0b6625bb'))),
                      height: 160.0,
                      width: 160.0,
                    ),
                    shadowColor: Colors.grey,
                    elevation: 10.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Samsung Galaxy EarBuds',
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '2500',
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
