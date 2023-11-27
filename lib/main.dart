import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/view_model/product_viewmodel.dart';
import 'package:flutter_architecture_template/product/init/application_initializer.dart';
import 'package:flutter_architecture_template/product/init/product_localization.dart';
import 'package:flutter_architecture_template/product/init/state_initializer.dart';
import 'package:flutter_architecture_template/product/init/theme/custom_dark_theme.dart';
import 'package:flutter_architecture_template/product/init/theme/custom_light_theme.dart';
import 'package:flutter_architecture_template/product/navigation/app_router.dart';
import 'package:flutter_architecture_template/product/state/container/product_state_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await ApplicationInitialize.setup();
  runApp(ProductLocalization(child: const StateInitialize(child: _MyApp())));
}

/// The MyApp class is a stateless widget in Dart.
final class _MyApp extends StatelessWidget {
  /// The line `const MyApp({super.key});` is defining a constructor
  const _MyApp();

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    context.watch<ProductViewModel>();
    ProductStateItems.productViewModel.state;
    return MaterialApp.router(
      themeMode: context.watch<ProductViewModel>().state.themeMode,
      routerConfig: _appRouter.config(),
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
