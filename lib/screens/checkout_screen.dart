import 'package:flutter/material.dart';

// checkout_page.dart

import 'package:flutter/material.dart';

import '../order_item.dart';

class CheckoutPage extends StatelessWidget {
  final List<Product> selectedProducts;
  final double total;

  CheckoutPage({required this.selectedProducts, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Selected Products:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: selectedProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = selectedProducts[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle:
                        Text('Price: Rs. ${product.price} x ${product.count}'),
                  );
                },
              ),
              SizedBox(height: 20),
              Text('Total: Rs. $total',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your checkout logic here, e.g., payment processing
                  // You can display a success message or navigate to a confirmation screen.
                  // You can also pass the selectedProducts and total to the confirmation screen if needed.
                },
                child: Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
