import 'dart:io';

import 'package:flutter/widgets.dart';

///Manage your network error with screen
final class ProductNetworkErrorManager {
  ProductNetworkErrorManager({required this.context});

  final BuildContext context;

  void handleError(int value) {
    if (value == HttpStatus.unauthorized) {
      //TODO: Handle unauthorized error here
    }
  }
}
