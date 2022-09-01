// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multivendor_app/model/ReusableItems/reusable_inner_divider.dart';
import 'package:multivendor_app/model/ReusableItems/reusable_list_tile.dart';
import '../model/ReusableItems/reusable_divider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    CollectionReference customer =
        FirebaseFirestore.instance.collection('customers');
    return FutureBuilder(
      future: customer.doc(_auth.currentUser!.uid).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('something went wrong'));
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text('Document does not exist');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  expandedHeight: 160,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) => FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        opacity: constraints.biggest.height <= 120 ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const Text('Account'),
                      ),
                      background: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.lightBlue,
                            Colors.lightBlueAccent,
                          ]),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundImage: NetworkImage('${data['image']}'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${data['fullName']}',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Cart',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.lightBlueAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Orders',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.lightBlueAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Wishlist',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.lightBlueAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableDivider(
                        title: 'Account Info',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 280,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableListTile(
                                  title: 'Email Address',
                                  subtitle: '${data['email']}',
                                  leading: Icons.email),
                              ReusableInnerDivider(),
                              ReusableListTile(
                                  title: 'Phone Number',
                                  subtitle: '8847665012',
                                  leading: Icons.phone),
                              ReusableInnerDivider(),
                              ReusableListTile(
                                  title: 'Address',
                                  subtitle: 'R.C.F Kapurthala Punjab',
                                  leading: Icons.location_pin),
                            ],
                          ),
                        ),
                      ),
                      ReusableDivider(
                        title: 'Account Settings',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 280,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableListTile(
                                  title: 'Edit Profile',
                                  subtitle: '',
                                  leading: Icons.edit),
                              ReusableInnerDivider(),
                              ReusableListTile(
                                  title: 'Change password',
                                  subtitle: '',
                                  leading: Icons.lock),
                              ReusableInnerDivider(),
                              ReusableListTile(
                                  title: 'Logout',
                                  subtitle: '',
                                  leading: Icons.logout),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return Center(
            child: CircularProgressIndicator(
          color: Colors.lightBlueAccent,
        ));
      },
    );
  }
}
