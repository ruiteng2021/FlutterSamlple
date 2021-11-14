import 'package:http_error_handling_1/models/user.dart';
import 'package:flutter/material.dart';

abstract class Repository {
  Future<List<User>> getUsers();
}
