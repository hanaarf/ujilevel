import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  //ngirim permintaan post ke url dgn gunain http,post
  postRequest({
    //ketentuan
    required String route,
    required Map<String, String> data,
  }) async {
    final String apiUrl = 'https://95d7-117-102-67-66.ngrok-free.app/api/auth';
  //api url diats buat jalanin perintah nannti ditambah sm routeny
    String url = apiUrl + route;
//header buat ngirim data settingan
    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: _header(),
    );
  }

  _header() => {
        'Content-type': 'application/json', //ada di header (key)
        'Accept': 'application/json', //ada di header (key)
      };
}
