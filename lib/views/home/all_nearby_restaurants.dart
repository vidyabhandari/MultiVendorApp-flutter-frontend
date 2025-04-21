import 'package:flutter/material.dart';

class AllNearByRestaurants extends StatelessWidget {
  const AllNearByRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: const Text("All Nearby Restaurants"),
      ),
      body: const Center(child: Text("All Nearby Restuarnts")),
    );
  }
}
