import 'package:flutter/foundation.dart';
import 'package:flutter_architecture_template/product/init/config/app_config.dart';
import 'package:flutter_architecture_template/product/init/config/dev_env.dart';
import 'package:flutter_architecture_template/product/init/config/prod_env.dart';

///Application environment management environment
final class AppEnvironment {
  ///Setup environment of application
  AppEnvironment.setup({required AppConfig config}) {
    _config = config;
  }

  ///Debug mode checker for which environment to use
  AppEnvironment.general() {
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }

  static late final AppConfig _config;
}

///get environment application items
enum AppEnvironmentItems {
  baseUrl,
  apiKey;

  ///Getting environment application items value
  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return AppEnvironment._config.baseUrl;
        case AppEnvironmentItems.apiKey:
          return AppEnvironment._config.apiKey;
      }
    } catch (e) {
      throw Exception('AppEnvironment not initialized');
    }
  }
}
