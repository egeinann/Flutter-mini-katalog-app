import 'package:flutter_riverpod/legacy.dart';
import '../../products/model/product_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  // 1 tane azaltır
  void decreaseProduct(Product product) {
    final index = state.indexWhere((p) => p.id == product.id);

    if (index != -1) {
      final newList = [...state];
      newList.removeAt(index);
      state = newList;
    }
  }

  // ürünü tamamen siler
  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  void clearCart() {
    state = [];
  }
}
