import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/order.dart';

class OrdersItem extends StatelessWidget {
  final OrderItem order;

  const OrdersItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        ListTile(
          title: Text('\$${order.amount}'),
          subtitle:
              Text("${DateFormat('dd MM yyyy hh:mm').format(order.dateTime)}"),
          trailing: IconButton(
              icon: const Icon(
                Icons.expand_more,
              ),
              onPressed: () {}),
        )
      ]),
    );
  }
}
