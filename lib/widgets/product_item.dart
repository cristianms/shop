import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/utils/app_routes.dart';

/// Widget que representa o produto no grid.
class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Obtém o produto do provider do produto atual
    Product product = Provider.of<Product>(context, listen: false);

    /// Obtém o carrinho do provider
    Cart cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        // Footer do card
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, productByProvider, child) => IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(productByProvider.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                productByProvider.toggleFavorite();
              },
            ),
          ),
          title: Text(product.title),
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product);
            },
          ),
        ),
      ),
    );
  }
}
