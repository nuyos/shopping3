//item/item_detail.dart

import 'package:flutter/material.dart';
import 'package:shopping3/model/cart.dart';
import 'package:shopping3/screen/cart_screen.dart';
import 'package:shopping3/const/colors.dart';


class ProductDetailPage extends StatefulWidget {
  final String image;
  final String productName;
  final String price;

  final List<CartItem> cartItems;

  ProductDetailPage({
    required this.image,
    required this.productName,
    required this.price,
    required this.cartItems, // 수정된 부분
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '박혁준 옷 입히기',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: LIGHT_GREY_COLOR,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'asset/img/${widget.image}',
              width: double.infinity,
              height: 300.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              widget.productName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.price,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedSize,
              items: ["S", "M", "L"].map((String size) {
                return DropdownMenuItem<String>(
                  value: size,
                  child: Text(size),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedSize = value;
                });
              },
              hint: Text('Select Size'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: () {
            addToCart();
          },
          child: const Text("장바구니"),
          style: FilledButton.styleFrom(
            backgroundColor: Colors.black54,
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey,
            disabledForegroundColor: Colors.black,
          ),
        ),
      ),
    );
  }

  void addToCart() {
    // 사이즈가 선택되지 않은 경우 addToCart 실행하지 않음
    if (selectedSize == null) {
      // snackBar: 간단한 메세지 코드를 주는 일시적 ui
      final snackBar = SnackBar(
        content: Text('사이즈를 선택해주세요!'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);//얘가 잇어야 메세지 표시됨
      return;
    }
    // 기호랑 쉼표를 제거 해서 순수한 숫자 문자열만 출력 되게 수정을 했음 => 오류 수정
    String priceWithoutCurrency = widget.price.replaceAll('₩', '').replaceAll(',', '');

    // 문자열을 정수로 변환
    double price = double.tryParse(priceWithoutCurrency) ?? 0;

    CartItem newItem = CartItem(
      productName: widget.productName,
      size: selectedSize ?? "N/A",
      price: price,
    );

    // 장바구니에 추가된 상품 리스트에 추가
    widget.cartItems.add(newItem);

    // 장바구니에 추가된 상품 리스트를 출력
    print("Cart Items: ${widget.cartItems}");

    // 선택한 상품 정보 초기화 => 나름 setStart를 사용해서 중요한 코드 부분인듯
    setState(() {
      selectedSize = null;
    });
    //장바구니에 상품 담기면 스낵바 띄움
    final snackBar = SnackBar(
      content: Text('장바구니에 상품이 담겼습니다.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}



