import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfeveret_task_yousuf/components/common_widgets.dart';
import 'package:myfeveret_task_yousuf/components/text_style.dart';
import 'package:myfeveret_task_yousuf/screens/home/models/trending_products.dart';
import 'package:myfeveret_task_yousuf/screens/home/widgets/title_text.dart';

class TrendingProducts extends StatelessWidget {
  final List<TrendingProductsRp> trendingProducts;

  TrendingProducts({this.trendingProducts});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        width: double.infinity,
        padding: EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(title: 'Trending Products'),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    trendingProducts.length,
                    (index) => TrendingProductsCard(
                          trendingProductsRp: trendingProducts[index],
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TrendingProductsCard extends StatelessWidget {
  final TrendingProductsRp trendingProductsRp;

  TrendingProductsCard({this.trendingProductsRp});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150,
        width: 110,
        margin: EdgeInsets.only(right: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110,
                width: 110,
                child: populateNetworkImage(
                    imgUrl: trendingProductsRp.productImage),
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        trendingProductsRp.productName,
                        maxLines: 1,
                        style: productNameTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Price: BDT ${trendingProductsRp.unitPrice.toString()}",
                        maxLines: 1,
                        style: productPriceTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
