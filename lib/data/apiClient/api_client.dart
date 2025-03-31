import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rms/core/app_export.dart';

class ApiClient extends GetConnect {

static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  ApiClient._internal();
  String? token = '';

  final String baseUrl = 'http://192.168.1.247:5000';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
    'Connection': 'keep-alive',
  };



  //CheclRole
  Future<http.Response?> login(String email, String password) async {
    print("hello");
    var url = Uri.parse('$baseUrl/post');
    var jsonToSend = jsonEncode({'email': email, 'password': password});
    print(jsonToSend);
    var response =
        await http.post(url, headers: headers, body: jsonToSend);
    var data = json.decode(response.body);
    print(data);
    return response;
  }

  
  //CheclRole
  Future<http.Response?> getItinerary() async {
    var url = Uri.parse('$baseUrl/get');
    var response =
        await http.get(url, headers: headers);
    var data = json.decode(response.body);
    print(data);
    return response;
  }

}
