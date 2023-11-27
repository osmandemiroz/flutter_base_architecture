import 'package:flutter_architecture_template/features/home/view/home_view.dart';
import 'package:flutter_architecture_template/features/home/view_model/home_viewmodel.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/base/base_state.dart';
import 'package:flutter_architecture_template/product/services/login_service.dart';
import 'package:flutter_architecture_template/product/services/manager/product_network_error_manager.dart';
import 'package:flutter_architecture_template/product/state/container/product_state_items.dart';

mixin HomeViewMixin on BaseState<HomeView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;
  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context: context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );

    _homeViewModel = HomeViewModel(
      authOperation: LoginService(networkManager: productNetworkManager),
    );
  }
}
