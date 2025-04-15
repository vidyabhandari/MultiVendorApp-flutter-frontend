import 'package:flutter/material.dart';
import 'package:my_firstapp/constants/constants.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, 
      backgroundColor: kOffWhite,
      title: const Text("Category Page")),
      body: Center(child: Text("Category Page")),
    );
  }
}
