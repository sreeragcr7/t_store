import 'package:t_store/features/shop/models/cart_item_model.dart';

class CartModel {
  final String cartId;
  final List<CartItemModel> items;

  CartModel({required this.cartId, required this.items});

  double get totalAmount => items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  Map<String, dynamic> toJson() => {'CartId': cartId, 'Items': items.map((item) => item.toJson()).toList()};

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    cartId: json['CartId'],
    items: (json['Items'] as List).map((item) => CartItemModel.fromJson(item)).toList(),
  );
}
