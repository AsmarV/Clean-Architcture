import 'dart:convert';

import 'package:clean_architecture_example/services/networks/network_response.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  String baseUrl = "https://dummyjson.com/";

  Map<String, String> baseHeader = {};

  ///GET REQUEST
  Future<NetworkResponse> get(
      {required String url, Map<String, String>? header}) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + url),
          headers: header ?? baseHeader);

      return _responseHandling(response);
    } catch (e) {
      rethrow;
    }
  }

  ///Handle status code
  NetworkResponse _responseHandling(http.Response response) {
    debugPrint("=+=+=+=+=+= ${response.statusCode} =+=+=+=+=+=");

    String? responseMessage;

    switch (response.statusCode) {
      case 200 || 201:
        responseMessage = "success";
      case 400 || 404:
        responseMessage = "invalid_data";
      case 401 || 403:
        responseMessage = "unauthorized";
      case >= 500 && < 600:
        responseMessage = "internal_server_error";
    }

    return NetworkResponse(
        statusCode: response.statusCode,
        responseMessage: responseMessage ?? '',
        data: jsonDecode(response.body.toString()));
  }
}
