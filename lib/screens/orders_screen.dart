import 'package:flutter/material.dart';
import '../providers/orders_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static String routePath = 'orders';
  @override
  Widget build(BuildContext context) {
    OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Orders'),
        ),
        body: ListView.builder(
            itemCount: ordersProvider.orders.length,
            itemBuilder: (ctx, i) => OrderItem(ordersProvider.orders[i])));
  }
}
