import 'package:ecommerce_app/api/model/response/BrandDTO.dart';
import 'package:ecommerce_app/api/model/response/category.dart';
import 'package:ecommerce_app/api/model/response/pagination_data.dart';
import 'package:ecommerce_app/domain/model/Product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final PaginationData? metadata;
  @JsonKey(name: "data")
  final List<ProductDto>? data;

  ProductsResponse({
    this.results,
    this.metadata,
    this.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsResponseToJson(this);
  }
}

@JsonSerializable()
class ProductDto {
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "subcategory")
  final List<CategoryDTO>? subcategory;
  @JsonKey(name: "ratingsQuantity")
  final int? ratingsQuantity;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "imageCover")
  final String? imageCover;
  @JsonKey(name: "category")
  final CategoryDTO? category;
  @JsonKey(name: "brand")
  final BrandDto? brand;
  @JsonKey(name: "ratingsAverage")
  final double? ratingsAverage;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "id")
  final String? id;

  ProductDto({
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
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return _$ProductDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductDtoToJson(this);
  }

  Product toProduct() {
    return Product(
      sold: sold,
      images: images,
      subcategory: subcategory
          ?.map(
            (e) => e.toCategory(),
          )
          .toList(),
      ratingsQuantity: ratingsQuantity,
      Id: Id,
      title: title,
      slug: slug,
      description: description,
      quantity: quantity,
      price: price,
      imageCover: imageCover,
      category: category?.toCategory(),
      brand: brand?.toBrand(),
      ratingsAverage: ratingsAverage,
      id: id,
    );
  }
}
