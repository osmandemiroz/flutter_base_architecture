import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductState extends Equatable {
  const ProductState({this.themeMode = ThemeMode.light});

  @override
  List<Object?> get props => [themeMode];

  final ThemeMode themeMode;

  ProductState copyWith({
    ThemeMode? themeMode,
  }) {
    return ProductState(themeMode: themeMode ?? this.themeMode);
  }
}
