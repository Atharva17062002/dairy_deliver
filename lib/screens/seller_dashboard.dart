import 'package:dairy_deliver/screens/customer_profile_screen.dart';
import 'package:dairy_deliver/screens/product_screen.dart';
import 'package:dairy_deliver/screens/vendor_profile.dart';
import 'package:flutter/material.dart';

import '../order_item.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({super.key});

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  List<OrderItem> dummyCurrentOrders = [
    OrderItem(
      productName: 'Cow Milk',
      productQuantity: '2L',
      productImage: 'assets/milk.png',
    ),
    OrderItem(
      productName: 'Goat Milk',
      productQuantity: '1.5L',
      productImage: 'assets/goatMilk.png',
    ),
    OrderItem(
      productName: 'Fresh Eggs',
      productQuantity: '18',
      productImage: 'assets/eggs.png',
    ),
    OrderItem(
      productName: 'Cheese',
      productQuantity: '200g',
      productImage: 'assets/cheese.png',
    ),
    OrderItem(
      productName: 'Yogurt',
      productQuantity: '400g',
      productImage: 'assets/yogurt.png',
    ),
    OrderItem(
      productName: 'Butter',
      productQuantity: '500g',
      productImage: 'assets/butter.png',
    ),
    // Add more items as needed
  ];

  List<ProductItem> dummyProducts = [
    ProductItem(
      productQuantity: '1L',
      productName: 'Cow Milk',
      productPrice: 'Rs. 50',
      productImage: 'assets/milk.png',
    ),
    ProductItem(
      productQuantity: '1L',
      productName: 'Goat Milk',
      productPrice: 'Rs. 45',
      productImage: 'assets/goatMilk.png',
    ),
    ProductItem(
      productQuantity: '12',
      productName: 'Fresh Eggs',
      productPrice: 'Rs. 60',
      productImage: 'assets/eggs.png',
    ),
    ProductItem(
      productQuantity: '500g',
      productName: 'Cheese',
      productPrice: 'Rs. 70',
      productImage: 'assets/cheese.png',
    ),
    ProductItem(
      productQuantity: '500g',
      productName: 'Yogurt',
      productPrice: 'Rs. 40',
      productImage: 'assets/yogurt.png',
    ),
    // Add more product items as needed
  ];
  List<Customers> dummyCustomers = [
    Customers(
        customerName: 'Atharva Udavant',
        customerAddress: 'SRM University, Ktr, Potheri, Chennai',
        customerContact: '9876543210',
        image: 'assets/roshan.png'),
    Customers(
        image: 'assets/john.png',
        customerName: 'John Doe',
        customerAddress: 'SRM University, Ktr, Potheri, Chennai',
        customerContact: '9876543210'),
    Customers(
        image: 'assets/jane.png',
        customerName: 'Jane Smith',
        customerAddress: 'SRM University, Ktr, Potheri, Chennai',
        customerContact: '9876543210'),
    Customers(
        image: 'assets/sara.png',
        customerName: 'Alice Johnson',
        customerAddress: 'SRM University, Ktr, Potheri, Chennai',
        customerContact: '9876543210'),
    Customers(
        image: 'assets/michael.png',
        customerName: 'Bob Williams',
        customerAddress: 'SRM University, Ktr, Potheri, Chennai',
        customerContact: '9876543210'),
    Customers(
        image: 'assets/emily.png',
        customerName: 'Samanyu Rao',
        customerAddress: 'SRM University, Ktr, Potheri, Chennai',
        customerContact: '9876543210'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff3966A4),
          title: const Text(
            'Dashboard',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return VendorProfile(
                          username: 'Roshan', email: 'roshan@gmail.com');
                    },
                  ),
                );
                // Handle logout here
              },
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 35,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome, Roshan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Your current balance is',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '₹ 500',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                            'Your current orders',
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
                          itemCount: dummyCurrentOrders.length,
                          itemBuilder: (BuildContext context, int index) {
                            final order = dummyCurrentOrders[index];
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
                                    backgroundImage:
                                        AssetImage(order.productImage),
                                  ),
                                  title: Text(order.productName),
                                  trailing: Text(
                                      'Qnty: ${order.productQuantity}',
                                      style: TextStyle(fontSize: 17)),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return ProductScreen(
                                            image: order.productImage,
                                            productName: order.productName,
                                            productDescription:
                                                'productDescription', // Replace with actual description
                                            productPrice: order.productQuantity,
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
                      )
                    ],
                  ),
                ),
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
                            'Your products',
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
                            final order = dummyProducts[index];
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
                                    backgroundImage:
                                        AssetImage(order.productImage),
                                  ),
                                  title: Column(
                                    children: [
                                      Text(order.productName),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(order.productQuantity,
                                          style: TextStyle(fontSize: 17)),
                                    ],
                                  ),
                                  trailing: Text('Price: ${order.productPrice}',
                                      style: TextStyle(fontSize: 17)),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return ProductScreen(
                                            image: order.productImage,
                                            productName: order.productName,
                                            productDescription:
                                                'productDescription', // Replace with actual description
                                            productPrice: order.productPrice,
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
                      )
                    ],
                  ),
                ),
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
                            'Your customers',
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
                          itemCount: dummyCustomers.length,
                          itemBuilder: (BuildContext context, int index) {
                            final customer = dummyCustomers[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(customer
                                        .image), // You can replace with actual customer avatars
                                  ),
                                  title: Text(customer.customerName,
                                      style: TextStyle(fontSize: 17)),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return CustomerProfileScreen(
                                            image: customer.image,
                                            username: customer.customerName,
                                            contact: customer.customerContact,
                                            address: customer.customerAddress,
                                          );
                                        },
                                      ),
                                    );
                                    // Handle customer details screen navigation here
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
