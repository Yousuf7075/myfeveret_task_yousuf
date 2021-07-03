import 'package:flutter/material.dart';
import 'package:myfeveret_task_yousuf/components/common_widgets.dart';
import 'package:myfeveret_task_yousuf/components/text_style.dart';
import 'package:myfeveret_task_yousuf/screens/home/models/products.dart';

class ProductCard extends StatelessWidget {
  final ProductsRp productsRp;

  ProductCard({this.productsRp});

  final String staticImageUrl =
      "https://st4.depositphotos.com/4329009/19956/v/600/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        child: Column(
          children: [
            Container(
              height: 40,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: ClipOval(
                      child: populateNetworkImage(
                          imgUrl: productsRp.companyLogo != null
                              ? productsRp.companyLogo
                              : staticImageUrl),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productsRp.companyName != null
                            ? productsRp.companyName
                            : "No Name",
                        maxLines: 1,
                        style: productNameTextStyle(),
                      ),
                      Text(
                        productsRp.friendlyTimeDiff,
                        maxLines: 1,
                        style: timerTextStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              productsRp.story,
              maxLines: 2,
              style: storyTextStyle(),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 190,
              child: populateNetworkImage(imgUrl: productsRp.storyImage),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.card_giftcard,
                      color: Colors.black,
                      size: 22,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'BDT ${productsRp.unitPrice}',
                      style: productCardTextStyle(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 22,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${productsRp.availableStock} Available Stock',
                      style: productCardTextStyle(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 22,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${productsRp.orderQty} Order(s)',
                      style: productCardTextStyle(),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
