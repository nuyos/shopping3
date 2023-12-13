//model/cart.dart 여기는 자기한테 맞게 변경 해야 할듯?

class Product {
  final String image;
  final String name;
  final double price;

  Product({
    required this.image,
    required this.name,
    required this.price,
  });
}

class CartItem {
  final String productName;
  final String size;
  final double price;

  CartItem({
  required this.productName,
    required this.size,
    required this.price,
  });
}