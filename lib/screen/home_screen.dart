// screen/home_screen.dart
import 'package:flutter/material.dart';
import 'package:shopping3/model/cart.dart';
import 'package:shopping3/screen/cart_screen.dart';
import 'package:shopping3/item/Ranking_list.dart';
import 'package:shopping3/screen/mypage_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = [
    Product(image: 'product1.jpg', name: 'Product 1', price: 100),
  ];
  List<CartItem> cartItems = []; // Maintain a list for cart items

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '박혁준 쇼핑몰',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: TabBarView(
          children: [
            RankList(cartItems: cartItems),
            Center(
              child: Text('Sale Content'),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          onTap: (index) {
            // 네비게이션 바 탭 시 실행될 거
            _handleBottomNavigationTap(context, index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'CART',//카트로 수정
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Page',
            ),
          ],
        ),
      ),
    );
  }


  void _handleBottomNavigationTap(BuildContext context, int index) {
    if (index == 0) {
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CartPage(cartItems: cartItems),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyPage(title: 'My Page'),
        ),
      );
    }
  }



  void addToCart(CartItem item) {
    setState(() {
      cartItems.add(item);
    });
  }
}
