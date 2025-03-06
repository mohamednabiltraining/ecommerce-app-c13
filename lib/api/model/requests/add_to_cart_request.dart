class AddToCartRequest {
  String? productId;

  AddToCartRequest({this.productId});

  factory AddToCartRequest.fromJson(Map<String, dynamic> json) {
    return AddToCartRequest(
      productId: json['productId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'productId': productId,
      };
}
