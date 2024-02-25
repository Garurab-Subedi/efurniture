import 'package:flutter/material.dart';
import 'package:furniture/app/model/product.dart';

import 'package:furniture/app/modules/home/components/category_list.dart';
import 'package:furniture/app/modules/home/components/product_card.dart';
import 'package:furniture/app/modules/home/components/search_box.dart';
import 'package:furniture/app/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const SearchBox(),
      const CategoryList(),
      const SizedBox(height: kDefaultPadding / 2),
      Expanded(
        child: Stack(
          children: <Widget>[
            // Our background
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
            // ProductCard(),
            ListView.builder(
              // here we use our demo procuts list
              itemCount: products.length,
              itemBuilder: (context, index) => ProductCard(
                itemIndex: index,
                product: products[index],
                press: () {},
                // press: () {
                //   Get.to(const DetailsView());
                // },
                // press: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => DetailsView(
                //         product: products[index],
                //       ),
                //     ),
                //   );
                // },
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
