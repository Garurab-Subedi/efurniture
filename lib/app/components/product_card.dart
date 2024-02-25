// import 'package:flutter/material.dart';

// import 'package:furniture/app/model/product.dart';

// import 'package:furniture/app/utils/constants.dart';


// class ProductCard extends StatelessWidget {
//   final Product product;
//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(5),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               blurRadius: 5,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         height: 100,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//                 height: 150,
//                 width: double.infinity,
//                 child: Image.network(
//                   getImageUrl(product.imageUrl ?? ''),
//                   fit: BoxFit.cover,
//                 )),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product.title ?? '',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Rs. ${product.price}',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       IconButton(
//                         padding: EdgeInsets.zero,
//                         onPressed: () {},
//                         icon: const Icon(
//                           Icons.shopping_bag_outlined,
//                           color: Colors.blue,
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
