import 'package:ecommerce_app/api/model/response/category.dart';
import 'package:ecommerce_app/api/model/response/pagination_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final PaginationData? metadata;
  @JsonKey(name: "data")
  final List<CategoryDTO>? data;

  CategoriesResponse({
    this.results,
    this.metadata,
    this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoriesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesResponseToJson(this);
  }
}
