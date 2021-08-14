import 'dart:convert';

import 'package:shamo/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = "https://shamo-backend.buildwithangga.id/api";

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      data
          .map(
            (product) => products.add(ProductModel.fromJson(product)),
          )
          .toList();
      return products;
    } else {
      throw Exception('Gagal get Products');
    }
  }
}
