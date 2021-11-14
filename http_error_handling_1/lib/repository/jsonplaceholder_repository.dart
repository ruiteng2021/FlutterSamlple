import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_error_handling_1/models/user.dart';
import 'package:http_error_handling_1/repository/repository.dart';
import 'package:http_error_handling_1/utility/http_exception.dart';

class JsonplaceholderRepository extends Repository {
  String baseUrl = 'https://jsonplaceholder.typicode.com';

  dynamic _response(http.Response response) {
    print(response.request?.url);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with Statuscode: ${response.statusCode}');
    }
  }

  @override
  Future<List<User>> getUsers() async {
    // throw UnimplementedError();
    List<User> userList = [];
    var url = Uri.parse('$baseUrl/user');

    try {
      var response = await http.get(url);
      var responseJson = _response(response);
      for (var i = 0; i < responseJson.length; i++) {
        userList.add(User.fromJson(responseJson[i]));
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return userList;
  }
}
