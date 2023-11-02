import 'package:dairy_deliver/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

import '../order_item.dart';

class VendorsScreen extends StatefulWidget {
  const VendorsScreen({super.key});

  @override
  State<VendorsScreen> createState() => _VendorsScreenState();
}

class _VendorsScreenState extends State<VendorsScreen> {
  List<Vendor> dummyVendors = [
    Vendor(
      name: 'Roshan',
      area: 'Potheri',
      image: 'assets/roshan.png',
      rating: '5',
    ),
    Vendor(
      name: 'John Doe',
      area: 'City Center',
      image: 'assets/john.png',
      rating: '4',
    ),
    Vendor(
      name: 'Jane Smith',
      area: 'Downtown',
      image: 'assets/jane.png',
      rating: '4.5',
    ),
    Vendor(
      name: 'Sara Johnson',
      area: 'Suburbia',
      image: 'assets/sara.png',
      rating: '3.8',
    ),
    Vendor(
      name: 'Michael Brown',
      area: 'Townsville',
      image: 'assets/michael.png',
      rating: '4.2',
    ),
    Vendor(
      name: 'Emily Wilson',
      area: 'Ruralville',
      image: 'assets/emily.png',
      rating: '4.9',
    ),
    Vendor(
      name: 'David Lee',
      area: 'City Heights',
      image: 'assets/david.png',
      rating: '4.6',
    ),
    Vendor(
      name: 'Lisa Miller',
      area: 'Central Park',
      image: 'assets/lisa.png',
      rating: '4.0',
    ),
    Vendor(
      name: 'William Clark',
      area: 'Downtown',
      image: 'assets/william.png',
      rating: '4.7',
    ),
    Vendor(
      name: 'Ava Davis',
      area: 'Suburbia',
      image: 'assets/ava.png',
      rating: '4.3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3966A4),
          title: const Text(
            'Vendors',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/userProfile');
              },
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final vendor = dummyVendors[index];
            return CustomListTile(
              name: vendor.name,
              area: vendor.area,
              image: vendor.image,
              rating: vendor.rating,
            );
          },
          itemCount: dummyVendors.length,
        ));
  }
}
