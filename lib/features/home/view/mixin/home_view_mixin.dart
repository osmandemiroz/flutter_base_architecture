import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/features/home/view/home_view.dart';
import 'package:flutter_architecture_template/product/services/login_service.dart';
import 'package:flutter_architecture_template/product/services/manager/product_network_error_manager.dart';
import 'package:flutter_architecture_template/product/state/container/product_state_items.dart';

mixin HomeViewMixin on State<HomeView> {
  late final LoginService loginService;
  late final ProductNetworkErrorManager productNetworkErrorManager;
  @override
  void initState() {
    super.initState();
    loginService =
        LoginService(networkManager: ProductStateItems.productNetworkManager);
    productNetworkErrorManager = ProductNetworkErrorManager(context: context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
  }
}
