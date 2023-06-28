import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Product {
  num id;
  String title;
  double price;
  String category;
  String description;
  String image;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
