import 'package:flutter_architecture_template/product/services/manager/index.dart';
import 'package:flutter_architecture_template/product/state/container/product_state_container.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();
}
