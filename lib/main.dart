import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_overview_screens.dart';
import './screens/product_details_screen.dart';
import './screens/cart_screen.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Order(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScrenn.routeName: (ctx) => CartScrenn(),
        },
      ),
    );
  }
}
