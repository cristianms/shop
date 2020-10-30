import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum MenuOptions { All, Favorites }

/// Widget de entrada do aplicativo
class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha loja'),
        actions: [
          // Menu de opções
          PopupMenuButton(
            onSelected: (MenuOptions optionSelected) {
              print(optionSelected);
              setState(() {
                _showFavoriteOnly =
                    optionSelected == MenuOptions.Favorites ? true : false;
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: MenuOptions.Favorites,
                child: Text('Favoritos'),
              ),
              PopupMenuItem(
                value: MenuOptions.All,
                child: Text('Todos'),
              ),
            ],
          ),
          Consumer<Cart>(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            builder: (context, cart, child) => Badge(
              value: cart.itemCount.toString(),
              child: child,
            ),
          ),
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
