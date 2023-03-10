import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'input.dart';
import 'dart:convert';

// const String baseUrl = 'http://10.0.2.2:5000';
const String baseUrl = 'https://suggestion-app.herokuapp.com';

class baseClient {
  Future<String> post(String api, Input object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object.toJson());

    debugPrint(url.toString());

    var response = await http.post(url, body: _payload, headers: _setHeaders());

    debugPrint('here');

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "An Error Occurred: ${response.statusCode}";
    }
  }
}

_setHeaders() => {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
