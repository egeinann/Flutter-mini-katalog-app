import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_katalog_app/features/cart/provider/cart_provider.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final totalPrice = cart.fold(0.0, (sum, product) => sum + product.price);
    final groupedCart = <int, Map<String, dynamic>>{};

    for (var product in cart) {
      if (groupedCart.containsKey(product.id)) {
        groupedCart[product.id]!['quantity']++;
      } else {
        groupedCart[product.id] = {'product': product, 'quantity': 1};
      }
    }

    final items = groupedCart.values.toList();

    return Scaffold(
      appBar: AppBar(leading: GestureDetector(
        onTap: ()=>Navigator.pop(context),
        child: Icon(Icons.chevron_left,size: 40,)),),
      body: SafeArea(
        child: cart.isEmpty
            ? const Center(child: Text("Sepetiniz boş"))
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final product = items[index]['product'];
                  final quantity = items[index]['quantity'];

                  return ListTile(
                    leading: Image.network(product.thumbnail),
                    title: Text(product.title),
                    subtitle: Text("\$${product.price}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            size: 30,
                          ),
                          onPressed: () {
                            ref
                                .read(cartProvider.notifier)
                                .decreaseProduct(product);
                          },
                        ),
                  
                        Text(
                          "$quantity",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 30,
                          ),
                  
                          onPressed: () {
                            ref
                                .read(cartProvider.notifier)
                                .addProduct(product);
                          },
                        ),
                  
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(cartProvider.notifier)
                                .removeProduct(product);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: cart.isNotEmpty
          ? Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Toplam: \$${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      ref.read(cartProvider.notifier).clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Sepet temizlendi!")),
                      );
                    },
                    child: const Text(
                      "ALL CLEAR",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
