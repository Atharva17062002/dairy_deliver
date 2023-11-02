import 'package:dairy_deliver/screens/product_screen.dart';
import 'package:flutter/material.dart';
import '../order_item.dart';
import 'checkout_screen.dart'; // Import the CheckoutPage

class MyCartPage extends StatelessWidget {
  final List<Product> selectedProducts;

  MyCartPage({required this.selectedProducts});

  @override
  Widget build(BuildContext context) {
    double total = 0;

    // Calculate the total price of selected products
    for (var product in selectedProducts) {
      total += product.count * double.parse(product.price);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedProducts.length,
              itemBuilder: (BuildContext context, int index) {
                final order = selectedProducts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    // height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(order.image),
                      ),
                      title: Column(
                        children: [
                          Text(order.name),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Quantity: ${order.count}'),
                        ],
                      ),
                      trailing: Text('Price: ${order.price}',
                          style: TextStyle(fontSize: 17)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ProductScreen(
                                image: order.image,
                                productName: order.name,
                                productDescription:
                                    'productDescription', // Replace with actual description
                                productPrice: order.price,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the CheckoutPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return CheckoutPage(
                          selectedProducts: selectedProducts, total: total);
                    },
                  ),
                );
              },
              child: Text('Checkout - Total: Rs. $total'),
            ),
          ),
        ],
      ),
    );
  }
}
