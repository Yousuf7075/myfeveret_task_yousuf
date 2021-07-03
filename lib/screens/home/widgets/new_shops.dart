
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfeveret_task_yousuf/components/common_widgets.dart';
import 'package:myfeveret_task_yousuf/models/new_shops.dart';
import 'package:myfeveret_task_yousuf/screens/home/widgets/title_text.dart';

class NewShops extends StatelessWidget {
  final List<NewShopsRp> newShops;

  NewShops({this.newShops});

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
            titleText(title: 'New Shops'),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    newShops.length,
                        (index) => NewShopsCard(
                      newShopsRp: newShops[index],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewShopsCard extends StatelessWidget {
  final NewShopsRp newShopsRp;

  NewShopsCard({this.newShopsRp});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: 110,
      margin: EdgeInsets.only(right: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            populateNetworkImage(imgUrl: newShopsRp.sellerItemPhoto),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                  EdgeInsets.only(left: 5, right: 5, top: 6, bottom: 6),
                  decoration: BoxDecoration(color: Colors.black26),
                  child:  Wrap(
                    children: [
                      Container(
                        child: Text(
                          newShopsRp.sellerName,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
