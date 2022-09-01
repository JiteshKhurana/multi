import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

snackbar(String title, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.cyan,
      content: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    ),
  );
}
