import 'package:mobile_scan/data/models/product_size.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String barcode;
  final String name;
  final String imageUrl;
  final List<ProductSize> sizes;

  const Product({
    required this.barcode,
    required this.name,
    required this.imageUrl,
    required this.sizes,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
