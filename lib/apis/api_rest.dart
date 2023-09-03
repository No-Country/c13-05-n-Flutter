import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String apiHeader = "blue-naughty-chimpanzee.cyclic.app";

class ApiCalls {
  Future<List<dynamic>> getApiInformation() async {
    var url = Uri.https(apiHeader, '/api/customers');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
      return [];
    }
  }

  Future<List<dynamic>> getAllProducts() async {
    var url = Uri.https(apiHeader, '/api/customers/products');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print('esta es la respuesta exitosa: $jsonResponse');
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

  Future<List<dynamic>> getProductList(String customerId) async {
    String apiHeader = "blue-naughty-chimpanzee.cyclic.app";
    var url = Uri.https(apiHeader, '/api/customers/$customerId/products');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print('esta es la respuesta exitosa: $jsonResponse');
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

  Future<dynamic> updateProduct(
      String userId, String productId, dynamic object) async {
    final String apiEndpoint =
        "https://blue-naughty-chimpanzee.cyclic.app/api/customers/$userId/products/$productId";
    final uri = Uri.parse(apiEndpoint);
    var payload = json.encode(object);

    final response = await http.put(
      uri,
      body: payload,
      headers: {"Content-Type": "application/json"},
    );

    try {
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.body);
        return response.body;
      }
    } catch (error) {
      print(error);
    }
    ;
  }
}
