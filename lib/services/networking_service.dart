import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingService {
  String url;
  NetworkingService(this.url);
  Future<void> getWeatherData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }
}
