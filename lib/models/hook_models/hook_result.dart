import 'package:flutter/material.dart';

class fetchHook {
  final dynamic data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback refetch;

  fetchHook(this.data, this.isLoading, this.error, this.refetch);
}
