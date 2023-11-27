import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/product/state/container/product_state_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: ProductStateItems.productViewModel),
      ],
      child: child,
    );
  }
}
