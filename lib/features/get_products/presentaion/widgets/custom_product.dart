import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_route/core/network/constants/colors.dart';
import 'package:task_route/features/get_products/data/models/product_model.dart';

class CustomProduct extends StatelessWidget {
  final ProductModel products;
  const CustomProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.sizeOf(context).width,
      // height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: products.images[0],
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )),
            SizedBox(
              height: 8,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                "${_getFirstTwoWords(products.title)}",
                style: TextStyle(color: primaryColor, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${products.description}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: primaryColor, fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "EGP ${products.price}",
                    style: TextStyle(color: primaryColor, fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Text(
                    "${products.price}",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        decoration: TextDecoration.lineThrough),
                  ),
                )
              ],
            ),
            Expanded(child: SizedBox()),
            Container(
              width: MediaQuery.sizeOf(context).width - 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        Text(
                          "Review (${products.reviews[0].rating})",
                          style: TextStyle(color: primaryColor, fontSize: 13),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: ShapeDecoration(
                          color: primaryColor, shape: OvalBorder()),
                      child: Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFirstTwoWords(String title) {
    // Split the title into words
    List<String> words = title.split(' ');

    // Take the first two words
    String firstTwoWords = words.take(2).join(' ');

    return firstTwoWords;
  }
}
