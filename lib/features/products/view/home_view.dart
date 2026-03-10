import 'package:flutter/material.dart';
import 'package:mini_katalog_app/features/products/view/product_grid_view.dart';
import 'package:mini_katalog_app/features/widgets/card_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Katalog"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartView()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(
            'https://wantapi.com/assets/banner.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Expanded(child: const ProductGridView()),
        ],
      ),
    );
  }
}
