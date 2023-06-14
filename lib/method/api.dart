import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  //ngirim url login
  postRequest({
    required String route,
    required Map<String, String> data,
  }) async {
    final String apiUrl = 'https://9de7-117-102-67-66.ngrok-free.app/api/auth';

    String url = apiUrl + route;

    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: _header(),
    );
  }

  _header() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
