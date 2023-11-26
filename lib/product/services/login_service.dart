// ignore_for_file: public_member_api_docs

import 'package:flutter_architecture_template/product/services/interfaces/auth_operation.dart';
import 'package:flutter_architecture_template/product/services/manager/project_service_path.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

final class LoginService extends AuthOperation {
  LoginService({required INetworkManager<EmptyModel> networkManager})
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<List<User>> users() async {
    final response = await _networkManager.send<User, List<User>>(
      ProjectServicePath.posts.value,
      parseModel: User(),
      method: RequestType.GET,
    );

    return response.data ?? [];
  }
}
