import 'package:gen/gen.dart';

abstract class AuthOperation {
  Future<List<User>> users();
}
