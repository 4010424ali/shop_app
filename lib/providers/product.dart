import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isfavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    this.isfavorite = false,
  });

  Future<void> toggleFavoriteStatus() async {
    final oldStatus = isfavorite;
    final url = 'https://shop-c1c59.firebaseio.com/products/$id.json';
    isfavorite = !isfavorite;
    notifyListeners();
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {'isFavorite': isfavorite},
        ),
      );
      if (response.statusCode >= 400) {
        isfavorite = oldStatus;
        notifyListeners();
      }
    } catch (error) {
      isfavorite = oldStatus;
      notifyListeners();
    }
  }
}
