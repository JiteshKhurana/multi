import 'package:flutter/material.dart';


class ReusableListTile extends StatelessWidget {
  const ReusableListTile(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.leading})
      : super(key: key);

  final String title;
  final String subtitle;
  final IconData leading;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(leading),
    );
  }
}