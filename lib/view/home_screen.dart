import 'package:flutter/material.dart';
import 'package:multivendor_app/view/inner_screens/search_screen.dart';
import '../model/ReusableItems/reusable_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            ReusableTab(title: 'Men'),
            ReusableTab(title: 'Women'),
            ReusableTab(title: 'Kids'),
            ReusableTab(title: 'Shoes'),
          ]),
          backgroundColor: Colors.white,
          elevation: 0,
          title: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.pushNamed(
                  context, SearchScreen.routeName);
            },
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.black),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'What are you looking for?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                  ]),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Men Category'),
            ),
            Center(
              child: Text('Women Category'),
            ),
            Center(
              child: Text('Kids Category'),
            ),
            Center(
              child: Text('Shoes Category'),
            ),
          ],
        ),
      ),
    );
  }
}
