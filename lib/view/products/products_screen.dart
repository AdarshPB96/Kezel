import 'package:flutter/material.dart';
import 'package:kezel/domain/data_model/data_model.dart';
import 'package:kezel/view/products/widgets/vertical_product_view.dart';

class ProductScreen extends StatelessWidget {
  final List<Product> products;
  final String itemName;
  const ProductScreen(
      {required this.products, required this.itemName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
      ),
      body: Column(
        children: [
          Expanded(child: verticalListView(products: products)),
        ],
      ),
    );
  }
}
