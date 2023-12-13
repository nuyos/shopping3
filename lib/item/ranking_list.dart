//item/Ranking_list.dart
import 'package:flutter/material.dart';
import 'package:shopping3/const/colors.dart';
import 'package:shopping3/item/item_detail.dart';
import 'package:shopping3/model/cart.dart';

class RankList extends StatelessWidget {
  final List<CartItem> cartItems;

  RankList({required this.cartItems});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2/4, //각 그리드 너비가 높이의 2/4로 조정
      ),
      padding: EdgeInsets.all(16.0),
      itemCount: 3,
      itemBuilder: (context, index) {
        final ranking = index + 1;
        final image = 'shopping${index + 1}.jpg';
        final productName = index == 0
            ? '노르딕 울 라운드 니트'
            : (index == 1 ? '야상점퍼' : '조거팬츠');
        final price = index == 0 ? '₩71,400' : (index == 1 ? '₩90,000' : '₩50,000');

        return GestureDetector(
          onTap: () {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  image: image,
                  productName: productName,
                  price: price,
                  cartItems: cartItems,
                ),
              ),
            );
          },
          child: _buildRankingItem(ranking, image, productName, price),
        );
      },
    );
  }

  Widget _buildRankingItem(int ranking, String image, String productName, String price) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'asset/img/$image',
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8.0,
                left: 8.0,
                child: Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Center(
                    child: Text(
                      '$ranking',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
