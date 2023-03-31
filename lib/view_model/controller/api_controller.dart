import 'dart:convert';

// import 'package:gsc/models/drugs_model.dart';
// import 'package:gsc/models/result_model.dart';
import 'package:gsc/models/drugs_model.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static String baseUrl = "http://41.216.186.97:5580";

  static Future<List<DrugsMini>> getAllDrugsProduct(int pages) async {
    final Uri url = Uri.parse('$baseUrl/drugs/all/products?page=1');

    bool error = false;
    Map<String, dynamic>? jsonResponse;
    List<DrugsMini> dataNewsItems = [];

    try {
      final response = await http.get(url);
      jsonResponse = jsonDecode(response.body);

      for (Map<String, dynamic> i in jsonResponse!['Data']) {
        dataNewsItems.add(DrugsMini(i['Id'], i['Name']));
      }
    } on Exception catch (e) {
      error = true;
    }

    return dataNewsItems;
  }
}
