import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/order_items.dart';
import '../providers/order.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('YOUR ORDER'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrdersItem(
          orderData.orders[i],
        ),
      ),
    );
  }
}
