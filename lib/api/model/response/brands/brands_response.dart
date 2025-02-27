import 'package:ecommerce_app/api/model/response/BrandDTO.dart';
import 'package:ecommerce_app/api/model/response/pagination_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brands_response.g.dart';

@JsonSerializable()
class BrandsResponse {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final PaginationData? metadata;
  @JsonKey(name: "data")
  final List<BrandDto>? data;

  BrandsResponse({
    this.results,
    this.metadata,
    this.data,
  });

  factory BrandsResponse.fromJson(Map<String, dynamic> json) {
    return _$BrandsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandsResponseToJson(this);
  }
}
