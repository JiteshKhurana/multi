import 'package:flutter/material.dart';
import 'package:multivendor_app/view/minor_screens/sub_category_screen.dart';
import '../../utilities/category_list.dart';

class AllCategoryScreen extends StatefulWidget {
  AllCategoryScreen({required this.nameOfCategory});
  final String nameOfCategory;

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            widget.nameOfCategory,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.68,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 50,
            children: List.generate(
              men.length,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SubCategoryScreen(
                          subCategoryName: widget.nameOfCategory[index],
                          mainCategoryName: widget.nameOfCategory,
                        );
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.26,
                      child: Image.asset('assets/images/men/men$index.jpg'),
                    ),
                    Text(
                      men[index],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
