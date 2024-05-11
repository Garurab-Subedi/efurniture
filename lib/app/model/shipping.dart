// To parse this JSON data, do
//
//     final shipping = shippingFromJson(jsonString);

import 'dart:convert';

Shipping shippingFromJson(String str) => Shipping.fromJson(json.decode(str));

String shippingToJson(Shipping data) => json.encode(data.toJson());

class Shipping {
  final String? cartId;
  final String? orderType;
  final String? referenceId;

  Shipping({
    this.cartId,
    this.orderType,
    this.referenceId,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        cartId: json["cart_id"],
        orderType: json["order_type"],
        referenceId: json["reference_id"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "order_type": orderType,
        "reference_id": referenceId,
      };
}
