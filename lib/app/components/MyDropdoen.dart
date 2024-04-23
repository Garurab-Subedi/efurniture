// import 'package:flutter/material.dart';

// class MyDropdownField extends StatelessWidget {
//   final TextEditingController controller;
//   final String? hintText;
//   final String? labelText;
//   final List<DropdownMenuItem<String>> items;
//   final String? Function(String?)? validator;

//   const MyDropdownField({
//     Key? key,
//     required this.controller,
//     this.hintText,
//     this.labelText,
//     required this.items,
//     this.validator,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       controller: controller,
//       items: items,
//       decoration: InputDecoration(
//         hintText: hintText,
//         labelText: labelText,
//       ),
//       validator: validator,
//       onChanged: (_) {}, // Add an empty onChanged to avoid error
//     );
//   }
// }
