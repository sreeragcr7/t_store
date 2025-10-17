
class CartItemModel {
  final String productId;
  final String variationId;
  final String title;
  final String image;
  final String brandName;
  final double price;
  final int quantity;
  final List<String> selectedVariation;

  CartItemModel({
    required this.productId,
    required this.variationId,
    required this.title,
    required this.image,
    required this.brandName,
    required this.price,
    required this.quantity,
    required this.selectedVariation,
  });

  Map<String, dynamic> toJson() => {
    'ProductId': productId,
    'VariationId': variationId,
    'Title': title,
    'Image': image,
    'BrandName': brandName,
    'Price': price,
    'Quantity': quantity,
    'SelectedVariation': selectedVariation,
  };

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    productId: json['ProductId'],
    variationId: json['VariationId'],
    title: json['Title'],
    image: json['Image'],
    brandName: json['BrandName'],
    price: json['Price'],
    quantity: json['Quantity'],
    selectedVariation: List<String>.from(json['SelectedVariation']),
  );
}
