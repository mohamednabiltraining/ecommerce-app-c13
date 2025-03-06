class Product {
  int? count;
  String? id;
  String? product;
  int? price;

  Product({this.count, this.id, this.product, this.price});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        count: json['count'] as int?,
        id: json['_id'] as String?,
        product: json['product'] as String?,
        price: json['price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        '_id': id,
        'product': product,
        'price': price,
      };
}
