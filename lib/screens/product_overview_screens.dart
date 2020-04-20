import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import './cart_screen.dart';

import '../providers/cart.dart';

enum FilterOption {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyShop',
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(
                () {
                  if (selectedValue == FilterOption.Favorite) {
                    _showOnlyFavorite = true;
                  } else {
                    _showOnlyFavorite = false;
                  }
                },
              );
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: const Text('Only Favorite'),
                value: FilterOption.Favorite,
              ),
              PopupMenuItem(
                child: const Text('Show All'),
                value: FilterOption.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScrenn.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorite),
    );
  }
}
