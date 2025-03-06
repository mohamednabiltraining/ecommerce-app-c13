// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartProductsResponse _$GetCartProductsResponseFromJson(
        Map<String, dynamic> json) =>
    GetCartProductsResponse(
      status: json['status'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cartId: json['cartId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartProductsResponseToJson(
        GetCartProductsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'numOfCartItems': instance.numOfCartItems,
      'cartId': instance.cartId,
      'data': instance.data,
    };
