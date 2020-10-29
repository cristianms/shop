import 'package:flutter/cupertino.dart';

/// Classe que representa o objeto Produto
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    this.isFavorite = false,
  });

  /// Alterna/inverte a flag de favorito
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
