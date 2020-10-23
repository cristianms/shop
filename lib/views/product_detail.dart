import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

/// Tela utilizada para representar os detalhes do produto
class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Produto a ser apresentado, recebido via rota
    final Product product =
        ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Container(),
    );
  }
}
