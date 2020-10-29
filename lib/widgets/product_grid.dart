import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_item.dart';

/// Widget responsável por apresentar o grid de produtos
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Lista de produtos do provider
    final List<Product> products = Provider.of<Products>(context).items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        // Usado o ".value" para referenciar um provider já criado
        return ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
