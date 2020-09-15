import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders_provider.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'providers/cart_provider.dart';
import './providers/products_prodiver.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (cxt) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (cxt) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrdersProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            textTheme: TextTheme(headline1: TextStyle(color: Colors.white))),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routePath: (ctx) => ProductDetailScreen(),
          CartScreen.routePath: (ctx) => CartScreen(),
          OrdersScreen.routePath: (ctx) => OrdersScreen()
        },
      ),
    );
  }
}
