import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/main.dart' as app;
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'Open home page and check press button ',
    ($) async {
      await app.main();
      await $.pumpAndSettle();

      await $(FloatingActionButton).tap();
      await $.pumpAndSettle();

      await $('1').waitUntilVisible();
    },
  );
}
