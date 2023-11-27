import 'package:flutter_architecture_template/features/home/view_model/state/view_model/product_viewmodel.dart';
import 'package:flutter_architecture_template/product/services/manager/index.dart';
import 'package:flutter_architecture_template/product/state/container/product_state_container.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();
}
