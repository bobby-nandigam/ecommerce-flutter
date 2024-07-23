import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  int _page = 1;
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    final url = 'https://fakestoreapi.com/products?limit=10&page=$_page';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> productList = json.decode(response.body);
      _products.addAll(productList.map((json) => Product.fromJson(json)).toList());
      _page++;
    }

    _isLoading = false;
    notifyListeners();
  }
}
