import 'package:flutter/material.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item.dart';
import 'package:provider/provider.dart';
import '../providers/orders_provider.dart';

class CartScreen extends StatelessWidget {
  static String routePath = 'cart';
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                      label: Text(
                        '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor),
                  FlatButton(
                      onPressed: () {
                        Provider.of<OrdersProvider>(context, listen: false)
                            .addOrder(cartProvider.items.values.toList(),
                                cartProvider.totalAmount);
                        cartProvider.clear();
                      },
                      child: Text(
                        'Order Now',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cartProvider.itemCount,
                  itemBuilder: (ctx, i) => CartItem(
                      cartProvider.items.values.toList()[i].id,
                      cartProvider.items.keys.toList()[i],
                      cartProvider.items.values.toList()[i].title,
                      cartProvider.items.values.toList()[i].price,
                      cartProvider.items.values.toList()[i].quantity)))
        ],
      ),
    );
  }
}
