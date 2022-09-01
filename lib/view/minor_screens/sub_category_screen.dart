import 'package:flutter/material.dart';
import 'package:multivendor_app/main.dart';

class SubCategoryScreen extends StatelessWidget {
  final String subCategoryName;
  final String mainCategoryName;
  static const String routeName = 'SubCategoryScreen';

  const SubCategoryScreen(
      {Key? key, required this.subCategoryName, required this.mainCategoryName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          subCategoryName,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(mainCategoryName),
      ),
    );
  }
}
