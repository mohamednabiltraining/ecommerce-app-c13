import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryDTO {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  CategoryDTO({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) {
    return _$CategoryDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryDTOToJson(this);
  }

  Category toCategory() {
    return Category(id: Id, image: image, title: name);
  }
}
