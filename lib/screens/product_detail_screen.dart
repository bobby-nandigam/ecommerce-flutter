import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as int;
    final product = Provider.of<ProductProvider>(context).products.firstWhere((prod) => prod.id == productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product.image),
            SizedBox(height: 10),
            Text(
              '\$${product.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Rating: ${product.rating}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
