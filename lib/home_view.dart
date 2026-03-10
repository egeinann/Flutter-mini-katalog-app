import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Catalog App'),
      ),
      body: const Center(
        child: Text('Welcome to the Mini Catalog App!'),
      ),
    );
  }
}