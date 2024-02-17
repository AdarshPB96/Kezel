import 'package:flutter/material.dart';
import 'package:kezel/constants/size.dart';
import 'package:kezel/domain/data_model/data_model.dart';
import 'package:shimmer/shimmer.dart';

Widget verticalListView({
  required List<Product> products,
}) {
  return products.isEmpty
      ? const Center(
          child: Text('No products'),
        )
      : ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.network(
                        products[index].image,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                tSizedBoxWidth10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index].name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      tSizedBoxHeight10,
                      Text(
                        "desc : ${products[index].desc}",
                        style: const TextStyle(fontSize: 18),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      tSizedBoxHeight10,
                      Text(
                        "${products[index].currency} : ${products[index].amount}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          itemCount: products.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 25,
          ),
        );
}
