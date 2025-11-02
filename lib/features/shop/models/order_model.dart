import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/authentication/models/address_model.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.address,
    this.deliveryDate,
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null ? THelperFunctions.getFormattedDate(deliveryDate!) : '';

  String get orderStatusText =>
      status == OrderStatus.delivered
          ? 'Delivered'
          : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  Map<String, dynamic> toJson() => {
    'Id': id,
    'UserId': userId,
    'Status': status.toString(),
    'TotalAmount': totalAmount,
    'OrderDate': orderDate,
    'PaymentMethod': paymentMethod,
    'Address': address?.toJson(),
    'DeliveryDate': deliveryDate,
    'Items': items.map((item) => item.toJson()).toList(), //Convert cartItem to map
  };

  // static OrderModel empty() =>
  //     OrderModel(id: '', status: '', items: '', totalAmount: '', orderData: '', deliveryDate: '');

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json['Id'],
    status: OrderStatus.values.byName(json['Status']),
    items: (json['Items'] as List).map((item) => CartItemModel.fromJson(item)).toList(),
    totalAmount: json['TotalAmount'],
    orderDate: DateTime.parse(json['OrderDate']),
    deliveryDate: DateTime.parse(json['DeliveryDate']),
  );

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    //Map JSON Record to Model
    return OrderModel(
      id: data['Id'] as String,
      userId: data['UserId'] as String,
      status: OrderStatus.values.firstWhere((e) => e.toString() == data['Status']),
      totalAmount: data['TotalAmount'] as double,
      orderDate: (data['OrderDate'] as Timestamp).toDate(),
      paymentMethod: data['PaymentMethod'] as String,
      address: AddressModel.fromMap(data['Address'] as Map<String, dynamic>),
      deliveryDate: data['DeliveryDate'] == null ? null : (data['DeliveryDate'] as Timestamp).toDate(),
      items:
          (data['Items'] as List<dynamic>)
              .map((itemData) => CartItemModel.fromJson(itemData as Map<String, dynamic>))
              .toList(),
    );
  }
}
