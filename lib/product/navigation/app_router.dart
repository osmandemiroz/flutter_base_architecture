import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/features/home/view/home_detail.dart';
import 'package:flutter_architecture_template/features/home/view/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)

///Project router manager
class AppRouter extends _$AppRouter {
  static const _replaceRouteName = 'View,Route';

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeDetailRoute.page,
        ),
      ];
}
