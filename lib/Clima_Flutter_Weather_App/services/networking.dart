import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String urlString;
  late final Uri url;

  NetworkHelper(this.urlString) {
    url = Uri.parse(urlString);
  }

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
