import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiCalls {

  Future<List<dynamic>> getApiInformation() async {
    String apiHeader = "blue-naughty-chimpanzee.cyclic.app";
    var url = Uri.https(apiHeader, '/api/customers');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
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

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
      print('esta es la respuesta exitosa: $jsonResponse');
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

}
