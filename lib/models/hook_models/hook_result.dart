import 'package:flutter/material.dart';
import 'package:my_firstapp/models/foods_model.dart';

class FetchHook {
  final dynamic data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchHook({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}

class FetchFoods {
  final List<FoodsModel> data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback refetch;

  FetchFoods({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
