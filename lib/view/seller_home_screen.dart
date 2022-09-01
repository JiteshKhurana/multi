import 'package:flutter/material.dart';
import 'package:multivendor_app/view/cart_screen.dart';
import 'package:multivendor_app/view/category_screen.dart';
import 'package:multivendor_app/view/dashboard_screen.dart';
import 'package:multivendor_app/view/home_screen.dart';
import 'package:multivendor_app/view/profile_screen.dart';

class SellerHomeScreen extends StatefulWidget {
  static const String routeName = 'SellerHomeScreen';
  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  int _selectedItem = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    CategoryScreen(),
    Center(child: Text('Shop Screen')),
    DashBoardScreen(),
    Center(child: Text('Upload Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedItem],
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: (index) {
            setState(() {
              _selectedItem = index;
            });
          },
          currentIndex: _selectedItem,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.lightBlueAccent,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shop,
              ),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.upload,
              ),
              label: 'Upload',
            ),
          ]),
    );
  }
}
