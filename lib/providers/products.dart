import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class Products with ChangeNotifier {
  /// Produtos
  List<Product> _items = DUMMY_PRODUCTS;

  /// Obtém uma cópia da lista de produtos
  List<Product> get items => [..._items];

  /// Adiciona um novo objeto Produto na lista de itens
  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
