import 'package:flutter/material.dart';
import 'package:kezel/domain/data_model/data_model.dart';
import 'package:kezel/provider/data_provider.dart';
import 'package:kezel/view/products/products_screen.dart';
import 'package:shimmer/shimmer.dart';

class SilverListwithSeparated extends StatelessWidget {
  const SilverListwithSeparated({
    Key? key,
    required this.dataProvider,
    required this.h,
    required this.w,
  }) : super(key: key);

  final DataProvider dataProvider;
  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: dataProvider.menuItems.length,
      itemBuilder: (context, index) {
        final MenuItem menuItem = dataProvider.menuItems[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductScreen(
                  products: menuItem.products, itemName: menuItem.name),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: h * 0.2,
              width: w * 0.2,
              child: Stack(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        menuItem.sliderImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            menuItem.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 50,
        );
      },
    );
  }
}
