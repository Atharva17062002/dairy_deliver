import 'package:dairy_deliver/screens/cart_screen.dart';
import 'package:dairy_deliver/screens/customer_profile_screen.dart';
import 'package:dairy_deliver/screens/login_screen.dart';
import 'package:dairy_deliver/screens/order_detail_screen.dart';
import 'package:dairy_deliver/screens/product_screen.dart';
import 'package:dairy_deliver/screens/seller_dashboard.dart';
import 'package:dairy_deliver/screens/signup_screen.dart';
import 'package:dairy_deliver/screens/user_profile_screen.dart';
import 'package:dairy_deliver/screens/vendor_portfolio_screen.dart';
import 'package:dairy_deliver/screens/vendor_profile.dart';
import 'package:dairy_deliver/screens/vendors_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // The default route (home screen)
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/vendors': (context) => VendorsScreen(),
        '/userProfile': (context) => UserProfileScreen(),
        // '/product': (context) => ProductScreen(),
        // '/vendorPortfolio': (context) => VendorPortfolio(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Dairy Deliver',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SignUpPage(),
    );
  }
}
