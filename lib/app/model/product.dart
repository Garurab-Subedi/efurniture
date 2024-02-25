// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);

// import 'dart:convert';

// List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String productToJson(List<Product> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Product {
//   final String? productId;
//   final String? title;
//   final String? description;
//   final String? categoryId;
//   final String? imageUrl;
//   final String? isAvailable;
//   final String? price;
//   final String? category;

//   Product({
//     this.productId,
//     this.title,
//     this.description,
//     this.categoryId,
//     this.imageUrl,
//     this.isAvailable,
//     this.price,
//     this.category,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         productId: json["product_id"],
//         title: json["title"],
//         description: json["description"],
//         categoryId: json["category_id"],
//         imageUrl: json["image_url"],
//         isAvailable: json["is_available"],
//         price: json["price"],
//         category: json["category"],
//       );

//   Map<String, dynamic> toJson() => {
//         "product_id": productId,
//         "title": title,
//         "description": description,
//         "category_id": categoryId,
//         "image_url": imageUrl,
//         "is_available": isAvailable,
//         "price": price,
//         "category": category,
//       };
// }

class Product {
  final int id, price;
  final String title, description, image;

  Product(
      {required this.id,
      required this.price,
      required this.title,
      required this.description,
      required this.image});
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 1,
    price: 56,
    title: "Classic Leather Arm Chair",
    image: "assets/images/Item_1.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 4,
    price: 68,
    title: "Poppy Plastic Tub Chair",
    image: "assets/images/Item_2.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 9,
    price: 39,
    title: "Bar Stool Chair",
    image: "assets/images/Item_3.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
];
