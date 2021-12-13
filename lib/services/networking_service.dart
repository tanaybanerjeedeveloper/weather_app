import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkingService {
  String url;
  NetworkingService(this.url);
  Future<dynamic> getWeatherData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = response.body;
      // print(data);
      print(jsonDecode(data));
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
