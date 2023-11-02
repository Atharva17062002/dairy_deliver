import 'package:flutter/material.dart';

class OrderItem {
  final String productName;
  final String productQuantity;
  final String productImage;

  OrderItem({
    required this.productName,
    required this.productQuantity,
    required this.productImage,
  });
}

class ProductItem {
  final String productQuantity;
  final String productName;
  final String productPrice;
  final String productImage;

  ProductItem({
    required this.productQuantity,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });
}

class Customers {
  final String image;
  final String customerName;
  final String customerAddress;
  final String customerContact;

  Customers({
    required this.image,
    required this.customerName,
    required this.customerAddress,
    required this.customerContact,
  });
}

class Vendor {
  final String name;
  final String area;
  final String image;
  final String rating;

  Vendor({
    required this.name,
    required this.area,
    required this.image,
    required this.rating,
  });
}

class Product {
  final String image;
  final String name;
  final String description;
  final String price;
  double count; // Add a count field

  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    this.count = 0, // Initialize count to 0 by default
  });
}
