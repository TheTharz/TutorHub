import 'dart:convert';
import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUrl = '';

  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse(_baseUrl + endpoint));
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Response status code ${response.statusCode}');
    }
  }
}
