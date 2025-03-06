import 'package:json_annotation/json_annotation.dart';

part 'subcategory.g.dart';

@JsonSerializable()
class Subcategory {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? slug;
  String? category;

  Subcategory({this.id, this.name, this.slug, this.category});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return _$SubcategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}
