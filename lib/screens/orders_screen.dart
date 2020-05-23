import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/order_items.dart';
import '../providers/order.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YOUR ORDER'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Order>(context, listen: false).fectchAndSetOrder(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              return const Text("Error Occur");
            } else {
              return Consumer<Order>(
                builder: (context, orderData, _) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) => OrdersItem(
                    orderData.orders[i],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
