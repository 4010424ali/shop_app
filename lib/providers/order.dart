import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  const OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrders(List<CartItem> cartPorducts, double total) async {
    final url = 'https://shop-c1c59.firebaseio.com/orders.json';
    final timestamp = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode(
            {
              'amount': total,
              'dateTime': timestamp.toIso8601String(),
              'products': cartPorducts
                  .map((cp) => {
                        'id': cp.id,
                        'title': cp.title,
                        'quantity': cp.quantity,
                        'price': cp.price
                      })
                  .toList()
            },
          ));
      _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['name'],
          amount: total,
          products: cartPorducts,
          dateTime: timestamp,
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
