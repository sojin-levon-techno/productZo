import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:machine_task/core/constants/app_constants.dart';
import 'package:machine_task/features/products/models/product_model.dart';

class ProductRemoteRepository {
  static Future<ProductModel> fetchProductsList() async {
    final uri = Uri.parse(AppConstants.BASEURL);
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);
      log("result : ${response.body}");
      log("statusCode : ${response.statusCode}");
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return ProductModel.fromJson(json);
      } else {
        throw "Error on products";
      }
    } catch (e) {
      log("Error on productFetch : $e");
      throw "$e";
    }
  }

  static Future<bool> updateProduct({
    required int id,
    required String title,
    required String desc,
    required String price,
    required String rating,
  }) async {
    final url = "${AppConstants.BASEURL}/$id";
    final uri = Uri.parse(url);
    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      "title": title,
      "description": desc,
      "price": double.tryParse(price) ?? 0.0,
      "rating": double.tryParse(rating) ?? 0.0,
    });

    try {
      final response = await http.put(uri, headers: headers, body: body);
      log("Edit Response Status: ${response.statusCode}");
      log("Edit Response Body: ${response.body}");

      if (response.statusCode == 200) {
        log("Edited Success ✅");
        return true;
      } else {
        log("Edit failed with status: ${response.statusCode}");
        throw "Error updating product: ${response.statusCode}";
      }
    } catch (e) {
      log("error on product Edit : $e");
      throw "$e";
    }
  }
}
