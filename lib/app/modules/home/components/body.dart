import 'package:flutter/material.dart';
import 'package:furniture/app/model/product.dart';
import 'package:furniture/app/modules/home/components/category_list.dart';
import 'package:furniture/app/modules/home/components/product_card.dart';
import 'package:furniture/app/modules/home/components/search_box.dart';
import 'package:furniture/app/modules/homedetails/views/homedetails_view.dart';
import 'package:furniture/app/utils/constants.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final List<Datum> products;

  const Body({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SearchBox(),
        const CategoryList(),
        const SizedBox(height: kDefaultPadding / 2),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => ProductCard(
                  product: products[index],
                  press: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DetailsView(
                    //       product: products[index],
                    //     ),
                    //   ),
                    // );

                    Get.to(() => HomedetailsView(products[index]));
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
