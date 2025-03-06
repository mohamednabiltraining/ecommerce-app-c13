import 'package:ecommerce_app/api/model/response/add_to_cart_response/add_to_cart_response.dart';

abstract class CartOnlineDataSource {
  Future<AddToCartResponse> addToCart(String token, Map<String, dynamic> body);
}
