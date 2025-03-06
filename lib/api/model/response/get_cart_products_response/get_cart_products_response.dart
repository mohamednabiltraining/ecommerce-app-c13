import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_cart_products_response.g.dart';

@JsonSerializable()
class GetCartProductsResponse {
  String? status;
  int? numOfCartItems;
  String? cartId;
  Data? data;

  GetCartProductsResponse({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory GetCartProductsResponse.fromJson(Map<String, dynamic> json) {
    return _$GetCartProductsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCartProductsResponseToJson(this);
}
