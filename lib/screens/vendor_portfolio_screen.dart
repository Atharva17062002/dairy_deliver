import 'package:dairy_deliver/screens/cart_screen.dart';
import 'package:dairy_deliver/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '../order_item.dart';

class VendorPortfolio extends StatefulWidget {
  const VendorPortfolio(
      {super.key,
      required this.image,
      required this.name,
      required this.area,
      required this.rating});

  final String image;
  final String name;
  final String area;
  final String rating;

  @override
  State<VendorPortfolio> createState() => _VendorPortfolioState();
}

class _VendorPortfolioState extends State<VendorPortfolio> {
  List<Product> selectedProducts = [];

  List<Product> dummyProducts = [
    Product(
      image: 'assets/milk.png',
      name: 'Cow Milk',
      description: 'Fresh cow milk',
      price: "50.0",
    ),
    Product(
      image: 'assets/goatMilk.png',
      name: 'Goat Milk',
      description: 'Fresh goat milk',
      price: '45.0',
    ),
    Product(
      name: 'Cheese',
      description: 'High-quality cheese',
      price: '10.0',
      image: 'assets/cheese.png',
    ),
    // Add more products as needed
  ];

  int itemCount = 0;

  List<String> comments = [
    'Good Quality Products',
    'Timely delivery',
    'Good attitude',
  ];

  void increment(Product product) {
    setState(() {
      product.count++;
      if (!selectedProducts.contains(product)) {
        selectedProducts.add(product);
      }
    });
  }

  void decrement(Product product) {
    if (product.count > 0) {
      setState(() {
        product.count--;
        if (product.count == 0) {
          selectedProducts.remove(product);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3966A4),
        title: const Text(
          'Vendor Portfolio',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return MyCartPage(selectedProducts: selectedProducts);
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(widget.image),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Area: ${widget.area}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Rating: ${widget.rating}',
                      style: const TextStyle(fontSize: 17),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // const SizedBox(
            //   height: 20,
            // ),

            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff3966A4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Products',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: dummyProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          Product product =
                              dummyProducts[index]; // Get the specific product

                          return ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              // Use the product's image
                              backgroundImage: AssetImage(product.image),
                            ),
                            title: Column(
                              children: [
                                Text(product.name),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Rs. ${product.price}',
                                    style: TextStyle(fontSize: 17)),
                              ],
                            ),
                            trailing: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () => decrement(product),
                                    ),
                                    Text('${product.count}'),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () => increment(product),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            onTap: () {
                              // Navigate to the product screen with the selected product
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return ProductScreen(
                                      image: product.image,
                                      productName: product.name,
                                      productDescription: product.description,
                                      productPrice: product.price.toString(),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.white, width: 1.0),
                  backgroundColor: Color(0xff3966A4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return MyCartPage(selectedProducts: selectedProducts);
                      },
                    ),
                  );
                },
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 240,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              // padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff3966A4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Reviews',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  // Display comments
                  Expanded(
                    child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(comments[index]),
                        );
                      },
                    ),
                  ),
                  // Add comment input field
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Add a comment...',
                      ),
                      onSubmitted: (newComment) {
                        setState(
                          () {
                            comments.add(newComment);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
