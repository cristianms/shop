import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/providers/product.dart';

/// Classe que representa os itens que serão adicionados no carrinho
class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  /// Construtor nomeado
  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

/// Classe que representa o carrinho de compras
class Cart with ChangeNotifier {
  /// Lista de itens adicionados
  Map<String, CartItem> _items = {};

  /// Get para _items
  Map<String, CartItem> get item {
    return {..._items};
  }

  /// Get count
  int get itemCount {
    return _items.length;
  }

  /// Adiciona ou incrementa novos itens no carrinho
  void addItem(Product product) {
    // Se já existir, atualiza/incrementa
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (CartItem antigoItem) => CartItem(
          id: antigoItem.id,
          title: antigoItem.title,
          quantity: antigoItem.quantity + 1,
          price: antigoItem.price,
        ),
      );
    } else {
      // Se não existir adiciona novo
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          title: product.title,
          quantity: 1,
          price: product.price,
        ),
      );
    }
    // Notifica listeners
    notifyListeners();
  }
}
