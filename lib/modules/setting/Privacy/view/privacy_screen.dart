import 'package:educational_platform/global/components/app_bar_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      appBar: AppBarApp(text: 'سياسة الخصوصية',),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'مقدمة',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF055C9D),
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w700,

              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'توضح سياسة الخصوصية هذه كيف تستخدم منصتنا البيانات الشخصية التي نجمعها من المستخدمين.',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF055C9D),
                fontSize: 13,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'البيانات التي نجمعها',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF0E86D4),
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w500,

                letterSpacing: -0.45,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'عند استخدامك لمنصتنا، قد نجمع معلومات مثل اسمك، العنوان البريدي، البريد الإلكتروني، رقم الهاتف، وغيرها من المعلومات الشخصية.',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF055C9D),
                fontSize: 14,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'كيف نستخدم بياناتك',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF0E86D4),
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w500,

                letterSpacing: -0.45,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'نستخدم هذه المعلومات لتقديم وتحسين خدماتنا. نحترم خصوصيتك ونلتزم بحماية بياناتك الشخصية وفقاً للضرورات القانونية.',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF055C9D),
                fontSize: 14,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'التواصل',

              style: TextStyle(
                color: Color(0xFF0E86D4),
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w500,

                letterSpacing: -0.45,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'لأي استفسارات حول سياسة الخصوصية هذه، يرجى التواصل معنا عبر البريد الإلكتروني.',
              style: TextStyle(
                color: Color(0xFF055C9D),
                fontSize: 14,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
