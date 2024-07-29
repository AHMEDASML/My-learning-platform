import 'package:educational_platform/global/components/app_bar_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:flutter/material.dart';

class UsagePolicyScreen extends StatefulWidget {
  const UsagePolicyScreen({Key? key}) : super(key: key);

  @override
  State<UsagePolicyScreen> createState() => _UsagePolicyScreenState();
}

class _UsagePolicyScreenState extends State<UsagePolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:AppBarApp(text: 'سياسة الاستخدام',),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
              Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(

                'مقدمة',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF055C9D),
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w700,
                 )
              ),
            ),
              Text(
              'تحتوي سياسة الاستخدام هذه على القواعد والإرشادات لاستخدام منصتنا الإلكترونية. عند استخدامك للمنصة، فأنت ملزم بالتقيد بهذه القواعد.',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF055C9D),
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w400,

                ),

            ),
            SizedBox(height: 20.0),

            // Subsection for fair use
              Text(
              '1. الاستخدام العادل',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF0E86D4),
                  fontSize: 15,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,

                  letterSpacing: -0.45,
                ),
              ),
              SizedBox(height: 8.0),
            Text(
              'يجب استخدام المنصة بطريقة عادلة ومسؤولة، ولا يُسمح باستخدامها لأي أغراض غير قانونية.',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF055C9D),
                fontSize: 14,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w400,

              ),
            ),

            SizedBox(height: 20.0),

            // Subsection for intellectual property
              Text(
              '2. حقوق الملكية الفكرية',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF0E86D4),
                  fontSize: 15,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,

                  letterSpacing: -0.45,
                ),
              ),
              SizedBox(height: 20.0),
            Text(
              'جميع المحتويات الموجودة على المنصة، بما في ذلك النصوص، الصور، الفيديوهات وغيرها، هي ملك للمنصة ومحمية بموجب قوانين حقوق الملكية الفكرية. لا يُسمح بنسخ أو توزيع أي جزء من هذه المحتويات دون إذن صريح.',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF055C9D),
                fontSize: 14,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 20.0),

            // Additional sections...
          ],
        ),
      ),
    );
  }
}
