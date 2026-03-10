import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_katalog_app/features/products/view/home_view.dart';


void main() {
  runApp(ProviderScope(child: const MiniCatologApp()));
}

class MiniCatologApp extends StatelessWidget {
  const MiniCatologApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
