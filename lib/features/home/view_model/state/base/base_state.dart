import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/view_model/product_viewmodel.dart';
import 'package:flutter_architecture_template/product/services/manager/index.dart';
import 'package:flutter_architecture_template/product/state/container/product_state_items.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
}
