import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/base/base_cubit.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/view_model/product_state.dart';

final class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel() : super(const ProductState());

  void changeTheme({ThemeMode themeMode = ThemeMode.light}) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
