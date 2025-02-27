import 'Brand.dart';
import 'Category.dart';

class Product {
  final int? sold;
  final List<String>? images;
  final List<Category>? subcategory;
  final int? ratingsQuantity;
  final String? Id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final Category? category;
  final Brand? brand;
  final double? ratingsAverage;
  final String? id;

  Product({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.Id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.id,
  });
}
