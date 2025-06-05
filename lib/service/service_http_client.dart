import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ServiceHttpClient {
  final String baseUrl = 'https://10.0.0.2:8000/api/';
  final secureStorage = FlutterSecureStorage();

  //POST
  Future<http.Response> post(
    String endpoint,
    Map<String, dynamic> map, {
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );
      return response;
    } catch (e) {
      throw Exception('POST request failed: $e');
    }
  }

  //GET
  Future<http.Response> get(String endpoint) async {
    final token = await secureStorage.read(key: 'token');
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.get(
        url,
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      return response;
    } catch (e) {
      throw Exception('GET request failed: $e');
    }
  }

  //PUT
  //DELETE
}
