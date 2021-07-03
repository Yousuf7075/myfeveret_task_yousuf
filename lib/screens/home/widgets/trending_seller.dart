import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfeveret_task_yousuf/screens/home/widgets/title_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrendingSeller extends StatelessWidget {
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
            titleText(title: 'Trending Sellers'),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 150,
              width: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://ea.sharedtoday.com/uploads/07anika.kabir@gmail.com-companyCoverPage_1615365329067.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(color: Colors.black12),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
