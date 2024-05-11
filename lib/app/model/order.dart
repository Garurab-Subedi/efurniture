// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  final bool? status;
  final Data? data;
  final String? message;

  Order({
    this.status,
    this.data,
    this.message,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  final int? id;
  final String? userId;
  final String? referenceId;
  final String? salesTotal;
  final String? discount;
  final String? grandTotal;
  final String? orderType;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Item>? items;

  Data({
    this.id,
    this.userId,
    this.referenceId,
    this.salesTotal,
    this.discount,
    this.grandTotal,
    this.orderType,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        referenceId: json["reference_id"],
        salesTotal: json["sales_total"],
        discount: json["discount"],
        grandTotal: json["grand_total"],
        orderType: json["order_type"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "reference_id": referenceId,
        "sales_total": salesTotal,
        "discount": discount,
        "grand_total": grandTotal,
        "order_type": orderType,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  final int? id;
  final String? orderId;
  final String? productId;
  final String? quantity;
  final String? price;
  final String? total;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic product;

  Item({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.price,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
        total: json["total"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "total": total,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product,
      };
}
