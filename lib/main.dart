import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/features/home/view/home_view.dart';
import 'package:flutter_architecture_template/product/init/application_initializer.dart';
import 'package:flutter_architecture_template/product/init/product_localization.dart';

Future<void> main() async {
  await ApplicationInitialize.setup();
  runApp(ProductLocalization(child: const _MyApp()));
}

/// The MyApp class is a stateless widget in Dart.
class _MyApp extends StatelessWidget {
  /// The line `const MyApp({super.key});` is defining a constructor
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomeView(),
    );
  }
}
