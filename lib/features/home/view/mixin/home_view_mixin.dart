import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/features/home/view/home_view.dart';
import 'package:flutter_architecture_template/product/services/manager/product_network_error_manager.dart';
import 'package:flutter_architecture_template/product/services/manager/product_service_manager.dart';

mixin HomeViewMixin on State<HomeView> {
  late final ProductNetworkManager productNetworkManager;
  late final ProductNetworkErrorManager productNetworkErrorManager;
  @override
  void initState() {
    super.initState();
    productNetworkManager = ProductNetworkManager.base();
    productNetworkErrorManager = ProductNetworkErrorManager(context: context);
    productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
  }
}
