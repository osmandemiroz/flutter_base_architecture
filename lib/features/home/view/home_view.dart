import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/features/home/view/mixin/home_view_mixin.dart';
import 'package:flutter_architecture_template/product/init/config/app_environment.dart';
import 'package:flutter_architecture_template/product/init/language/locale_keys.g.dart';
import 'package:flutter_architecture_template/product/init/product_localization.dart';
import 'package:flutter_architecture_template/product/utility/constants/enums/locales.dart';
import 'package:gen/gen.dart';

part 'widget/home_app_bar.dart';

/// The HomeView class is a stateful widget in Dart.
class HomeView extends StatefulWidget {
  /// The line `const HomeView({super.key});` is defining a constructor
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.icLove.svg(),
          ElevatedButton(
            onPressed: () {},
            child: Text(AppEnvironmentItems.baseUrl.value),
          ),
          const Text('change language'),
          ElevatedButton(
            onPressed: () => ProductLocalization.updateLanguage(
              context: context,
              value: Locales.tr,
            ),
            child: const Text(LocaleKeys.general_button_save).tr(),
          ),
        ],
      ),
    );
  }
}
