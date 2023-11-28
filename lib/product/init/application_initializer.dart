import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture_template/product/init/config/app_environment.dart';
import 'package:flutter_architecture_template/product/state/container/product_state_container.dart';
import 'package:flutter_architecture_template/product/state/container/product_state_items.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

@immutable

///this class used to initialize the starting process
final class ApplicationInitialize {
  const ApplicationInitialize._();

  ///project basic requirement initialize
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  /// Project initializer function
  static Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    //TODO: add splash screen
    await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      ///crashlytics log insert here
      ///custom service or custom logger insert here

      //   TODO: add custom logger
      Logger().e(details.exceptionAsString());
    };

    AppEnvironment.general();

    ProductContainer.setup();

    await ProductStateItems.productCache.init();
    //Dependency initialize
    //
    //envied
  }
}
