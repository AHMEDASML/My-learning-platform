import 'package:flutter/material.dart';

void showConfirmDialog(BuildContext context, String title, String content,
    void Function()? onPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xFF055C9D),
            fontSize: 14,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        content: Text(
          content,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xFF0E86D4),
            fontSize: 12,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'لا',
              style: TextStyle(
                color: Color(0xFF0E86D4),
                fontSize: 14,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
              onPressed: onPressed,
              child: const Text(
                'نعم',
                style: TextStyle(
                  color: Color(0xFF0E86D4),
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              )),
        ],
      );
    },
  );
}
