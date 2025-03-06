import 'package:collection/collection.dart';

import 'metadata.dart';
import 'sub_category_dto.dart';

class SubCategoriesResponse {
  int? results;
  Metadata? metadata;
  List<SubCategoryDTO>? data;

  SubCategoriesResponse({this.results, this.metadata, this.data});

  factory SubCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return SubCategoriesResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubCategoryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'results': results,
        'metadata': metadata?.toJson(),
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SubCategoriesResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => results.hashCode ^ metadata.hashCode ^ data.hashCode;
}
