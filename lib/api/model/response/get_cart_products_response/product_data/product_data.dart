import 'package:json_annotation/json_annotation.dart';

import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

part 'product_data.g.dart';

@JsonSerializable()
class ProductData {
  List<Subcategory>? subcategory;
  @JsonKey(name: '_id')
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;

  ProductData({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return _$ProductDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
