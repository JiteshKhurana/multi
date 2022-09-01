import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multivendor_app/view/customer_home_screen.dart';
import 'package:multivendor_app/view/auth/customer_login_screen.dart';
import 'package:multivendor_app/view/auth/landing_customer_screen.dart';
import 'package:multivendor_app/view/inner_screens/search_screen.dart';
import 'package:multivendor_app/view/minor_screens/sub_category_screen.dart';

import 'view/auth/landing_seller_screen.dart';
import 'view/auth/seller_login_screen.dart';
import 'view/seller_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    print('Completed');
  });
  runApp(const MultivendorApp());
}

class MultivendorApp extends StatelessWidget {
  const MultivendorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan, fontFamily: "Barlow"),
      debugShowCheckedModeBanner: false,
      initialRoute: SellerHomeScreen.routeName,
      routes: {
        CustomerHomeScreen.routeName: (context) => CustomerHomeScreen(),
        SellerHomeScreen.routeName: (context) => SellerHomeScreen(),
        LandingCustomerScreen.routeName: (context) => LandingCustomerScreen(),
        LandingSellerScreen.routeName: (context) => LandingSellerScreen(),
        SellerLoginScreen.routeName: (context) => SellerLoginScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
      },
    );
  }
}
