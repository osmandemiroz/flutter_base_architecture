import 'package:flutter_architecture_template/product/services/interfaces/auth_operation.dart';
import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';

final class LoginServiceMock extends Mock implements AuthOperation {
  @override
  Future<List<User>> users() async {
    return [
      User(
        id: 1,
        body: 'body',
        title: 'title',
        userId: 2,
      ),
      User(
        id: 2,
        body: 'body2',
        title: 'title2',
        userId: 3,
      ),
      User(
        id: 3,
        body: 'body3',
        title: 'title3',
        userId: 4,
      ),
    ];
  }
}
