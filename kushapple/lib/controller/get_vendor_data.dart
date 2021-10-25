import 'package:http/http.dart';
import 'dart:convert';

class GetVendors {
  Future<void> GetVendordata() async {
    Response response =
        await get(Uri.parse('http://api.kushmapper.com/v1/vendors'));
    Map data = jsonDecode(response.body);
    print(data);
    // String datetime = data['datetime'];
    // String offset = data['utc_offset'].substring(1, 3);
  }
}

