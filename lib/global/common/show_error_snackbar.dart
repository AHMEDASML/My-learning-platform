import 'package:flutter/material.dart';

void showFormErrorSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('يجب تعبئة كل الحقول بشكل صحيح')),
  );
}
