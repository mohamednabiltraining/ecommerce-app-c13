import 'data.dart';

class AddToCartResponse {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  Data? data;

  AddToCartResponse({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      cartId: json['cartId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'numOfCartItems': numOfCartItems,
        'cartId': cartId,
        'data': data?.toJson(),
      };
}
