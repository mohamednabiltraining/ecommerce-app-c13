import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BrandDTO.g.dart';

@JsonSerializable()
class BrandDto {
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

  BrandDto({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandDto.fromJson(Map<String, dynamic> json) {
    return _$BrandDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandDtoToJson(this);
  }

  Brand toBrand() {
    return Brand(
      id: Id,
      name: name,
      slug: slug,
      image: image,
    );
  }
}
