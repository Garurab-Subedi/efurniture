// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  final bool? status;
  final List<Datum>? data;
  final String? message;

  Product({
    this.status,
    this.data,
    this.message,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  final int? productId;
  final String? productName;
  final String? productCode;
  final String? productTags;
  final String? productColors;
  final String? productShortDescription;
  final dynamic productLongDescription;
  final String? productSlug;
  final String? productPrice;
  final String? productThumbnail; // Updated to String for URL
  final String? productStatus;
  final String? subCategoryId;
  final String? brandId;
  final String? vendorId;
  final String? productQuantity;

  Datum({
    this.productId,
    this.productName,
    this.productCode,
    this.productTags,
    this.productColors,
    this.productShortDescription,
    this.productLongDescription,
    this.productSlug,
    this.productPrice,
    this.productThumbnail, // Updated to include product thumbnail URL
    this.productStatus,
    this.subCategoryId,
    this.brandId,
    this.vendorId,
    this.productQuantity,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        productName: json["product_name"],
        productCode: json["product_code"],
        productTags: json["product_tags"],
        productColors: json["product_colors"],
        productShortDescription: json["product_short_description"],
        productLongDescription: json["product_long_description"],
        productSlug: json["product_slug"],
        productPrice: json["product_price"],
        productThumbnail: json["product_thumbnail"], // Construct URL here
        productStatus: json["product_status"],
        subCategoryId: json["sub_category_id"],
        brandId: json["brand_id"],
        vendorId: json["vendor_id"],
        productQuantity: json["product_quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_code": productCode,
        "product_tags": productTags,
        "product_colors": productColors,
        "product_short_description": productShortDescription,
        "product_long_description": productLongDescription,
        "product_slug": productSlug,
        "product_price": productPrice,
        "product_thumbnail": productThumbnail,
        "product_status": productStatus,
        "sub_category_id": subCategoryId,
        "brand_id": brandId,
        "vendor_id": vendorId,
        "product_quantity": productQuantity,
      };
}
