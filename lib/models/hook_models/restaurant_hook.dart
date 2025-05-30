import 'package:flutter/material.dart';
import 'package:my_firstapp/models/restaurants_model.dart';

class FetchRestaurant {
  final Restaurantsmodel? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchRestaurant({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}