import 'package:flutter/material.dart';

class AllFastestFoodsPage extends StatelessWidget {
  const AllFastestFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: const Text("All FastestFoods Restaurants"),
      ),
      body: const Center(child: Text("All Fastest Food")),
    );
  }
}
