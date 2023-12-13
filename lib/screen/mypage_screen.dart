import 'package:flutter/material.dart';
import 'package:shopping3/model/view_model.dart';
import 'package:shopping3/screen/kakao_login.dart';
import 'package:shopping3/screen/login_page.dart';
import 'package:shopping3/screen/cart_screen.dart';
import 'package:shopping3/model/cart.dart';
import 'package:shopping3/screen/order_list.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final viewModel = MainViewModel(KakaoLogin());
  List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('카카오 계정 로그인'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(title: "카카오로그인")),
                //로그인 페이지로 이동
              );
            },
          ),
          Divider(), //리스트 구분선
          ListTile(
            title: Text('주문조회'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderListPage(title: "")),
                //주문조회 페이지로 이동
              );
            },
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
            label: 'CART', //카트로 수정
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Page',
          ),
        ],
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
}
