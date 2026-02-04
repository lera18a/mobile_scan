import 'package:json_annotation/json_annotation.dart';

part 'product_size.g.dart';

@JsonSerializable()
class ProductSize {
  final String size;
  final bool inStock;
  final int qty;

  ProductSize({required this.size, required this.inStock, required this.qty});

  factory ProductSize.fromJson(Map<String, dynamic> json) =>
      _$ProductSizeFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSizeToJson(this);
}
