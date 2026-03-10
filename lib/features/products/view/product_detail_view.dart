import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_katalog_app/features/widgets/card_provider.dart';
import '../model/product_model.dart';

class ProductDetailView extends ConsumerWidget {
  final Product product;
  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.thumbnail),
            const SizedBox(height: 16),
            Text(product.title,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description),
            const SizedBox(height: 8),
            Text("Fiyat: \$${product.price}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("Marka: ${product.brand}"),
            const SizedBox(height: 8),
            Text("Kategori: ${product.category}"),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text("Sepete Ekle"),
                onPressed: () {
                  ref.read(cartProvider.notifier).addProduct(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Ürün sepete eklendi")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}