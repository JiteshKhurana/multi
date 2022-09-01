import 'package:flutter/material.dart';

class ReusableInnerDivider extends StatelessWidget {
  const ReusableInnerDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        color: Colors.grey,
        thickness: 1,
      ),
    );
  }
}