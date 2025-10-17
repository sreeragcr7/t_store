import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/utils/constants/enums.dart';

class OrderModel {
  final String id;
  final OrderStatus status;
  final List<CartItemModel> items;
  final double totalAmount;
  final DateTime orderData;
  final DateTime deliveryDate;

  OrderModel({
    required this.id,
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderData,
    required this.deliveryDate,
  });

  Map<String, dynamic> toJson() => {
    'Id': id,
    'Status': status.name,
    'Items': items.map((item) => item.toJson()).toList(),
    'TotalAmount': totalAmount,
    'OrderDate': orderData.toIso8601String(),
    'DeliveryDate': deliveryDate.toIso8601String(),
  };

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json['Id'],
    status: OrderStatus.values.byName(json['Status']),
    items: (json['Items'] as List).map((item) => CartItemModel.fromJson(item)).toList(),
    totalAmount: json['TotalAmount'],
    orderData: DateTime.parse(json['OrderDate']),
    deliveryDate: DateTime.parse(json['DeliveryDate']),
  );
}
