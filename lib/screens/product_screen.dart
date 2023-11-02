import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(
      {super.key,
      required this.image,
      required this.productName,
      required this.productDescription,
      required this.productPrice});

  final String image;
  final String productName;
  final String productDescription;
  final String productPrice;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String selectedValue = '500ml'; // Set the initial selected value

  List<String> dropdownItems = ['500ml', '1L', '2L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3966A4),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xff3966A4),
        centerTitle: true,
        title: const Text(
          'Dairy Deliver',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          Center(
            child: Container(
              child: Image.asset(widget.image),
              height: 250,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            width: 300,
            child: Text(
              widget.productName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 300,
            child: Text(
              widget.productDescription,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 0.3,
            indent: 50,
            endIndent: 50,
          ),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedValue, // The currently selected value
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: dropdownItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,
                          style: const TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                ),
                const Text(
                  '₹ 50',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Subscribe',
                style: TextStyle(
                  color: Color(0xff3966A4),
                  fontSize: 15,
                ),
              ),
            ),
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
              onPressed: () {},
              child: const Text(
                'Buy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              color: Color(0xff3966A4),
            ),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: const Icon(
          //     Icons.shopping_cart,
          //     color: Color(0xff3966A4),
          //   ),
          //   label: 'Cart',
          // ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person, color: Color(0xff3966A4)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
