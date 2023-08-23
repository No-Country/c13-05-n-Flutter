import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiCalls {
  String apiHeader = "blue-green-catfish-cuff.cyclic.cloud";
  Future<List<dynamic>> getApiInformation() async {
    var url = Uri.https(apiHeader, '/api/customers', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
      // print(jsonResponse);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
