import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<Map<String, dynamic>> loadProductData() async {
  final String response = await rootBundle.loadString('assets/products.json');
  return json.decode(response);
}
