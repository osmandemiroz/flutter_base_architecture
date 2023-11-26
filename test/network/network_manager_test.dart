import 'dart:io';

import 'package:flutter_architecture_template/product/init/config/app_environment.dart';
import 'package:flutter_architecture_template/product/services/manager/product_service_manager.dart';
import 'package:flutter_architecture_template/product/services/manager/project_service_path.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final ProductNetworkManager manager;
  setUp(() {
    AppEnvironment.general();
    manager = ProductNetworkManager.base();
  });

  test(
    'test network',
    () async {
      final response = await manager.send<User, List<User>>(
        ProjectServicePath.posts.value,
        parseModel: User(),
        method: RequestType.GET,
      );
      expect(response.data, isNotNull);
    },
  );
  test(
    'test network with error',
    () async {
      manager.listenErrorState(
        onErrorStatus: (value) {
          if (value == HttpStatus.unauthorized) {}
          expect(value, isNotNull);
        },
      );
      final response = await manager.send<User, List<User>>(
        ProjectServicePath.userV1.value,
        parseModel: User(),
        method: RequestType.GET,
      );
      expect(response.data, null);
    },
  );
}
