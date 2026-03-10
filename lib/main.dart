import 'package:flutter/material.dart';
import 'package:mini_katalog_app/home_view.dart';

void main() {
  runApp(const MiniCatologApp());
}

class MiniCatologApp extends StatelessWidget {
  const MiniCatologApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      home: HomeView(),
    );
  }
}