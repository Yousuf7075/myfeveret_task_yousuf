import 'package:flutter/material.dart';
import 'package:myfeveret_task_yousuf/screens/home/models/products.dart';
import 'package:myfeveret_task_yousuf/screens/home/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  final List<ProductsRp> products;

  ProductList({this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              productsRp: products[index],
            );
          }),
    );
  }
}
