import 'package:http_error_handling_1/models/user.dart';
import 'package:http_error_handling_1/repository/repository.dart';

class UserController {
  final Repository _repository;

  UserController(this._repository);

  Future<List<User>> fetchUserList() async {
    return _repository.getUsers();
  }
}
