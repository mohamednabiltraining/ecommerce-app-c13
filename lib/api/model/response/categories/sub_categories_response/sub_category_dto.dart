import 'package:collection/collection.dart';
import 'package:ecommerce_app/domain/model/sub_category.dart';

class SubCategoryDTO {
  String? id;
  String? name;
  String? slug;
  String? category;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubCategoryDTO({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  factory SubCategoryDTO.fromJson(Map<String, dynamic> json) => SubCategoryDTO(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        category: json['category'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'category': category,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SubCategoryDTO) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  SubCategory toSubCategory() {
    return SubCategory(id: id, category: category, name: name, slug: slug);
  }
}
