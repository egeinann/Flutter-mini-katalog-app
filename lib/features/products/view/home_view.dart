import 'package:flutter/material.dart';
import 'package:mini_katalog_app/features/products/view/product_grid_view.dart';
import 'package:mini_katalog_app/features/cart/view/cart_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          title: const Text(
            "Discover",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_bag_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartView()),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              const Text(
                "Find your perfect product",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search products",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),

                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://wantapi.com/assets/banner.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(child: const ProductGridView()),
            ],
          ),
        ),
      ),
    );
  }
}
