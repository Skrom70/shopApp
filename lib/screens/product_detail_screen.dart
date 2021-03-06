import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_prodiver.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routePath = 'product-details';

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String;
    Product product =
        Provider.of<ProductsProvider>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '\$${product.price}',
          style: TextStyle(color: Colors.grey, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Text(
            product.description,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        )
      ])),
    );
  }
}
