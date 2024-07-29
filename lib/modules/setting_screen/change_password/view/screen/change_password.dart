import 'package:educational_platform/global/components/button_app.dart';
import 'package:educational_platform/global/components/dived_widget.dart';

import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/constants.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue.shade200, Colors.purple.shade200],
        ),

        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [




                Image.asset(ImagesApp.loukPass,width: 100,height: 100),

              const SizedBox(height: 20),
              // CustomTextField(
              //   isPassword: false,
              //   hintText: 'كلمة المرور الحالية',
              //   labelText: 'كلمة المرور',
              //   fieldType: CustomFieldType.password,
              //   keyboardType: TextInputType.phone, // Ensure this is set for phone input
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'الرجاء ادخال كلمة المرور';
              //     }
              //     return null;
              //   },
              // ),
              const SizedBox(height: 50),

              divedApp(context: context, height: 1,),
              const SizedBox(height: 50),

              // CustomTextField(
              //   isPassword: false,
              //   hintText: 'كلمة المرور الجديدة',
              //   labelText: 'كلمة المرور',
              //   fieldType: CustomFieldType.password,
              //   keyboardType: TextInputType.phone, // Ensure this is set for phone input
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'الرجاء ادخال كلمة المرور';
              //     }
              //     return null;
              //   },
              // ),






              SizedBox(height: 20,),
              // CustomTextField(
              //   isPassword: false,
              //   hintText: 'تاكيد كلممة المرور الجديدة ',
              //   labelText: 'كلمة المرور',
              //   fieldType: CustomFieldType.password,
              //   keyboardType: TextInputType.phone, // Ensure this is set for phone input
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'الرجاء ادخال كلمة المرور';
              //     }
              //     return null;
              //   },
              // ),



              SizedBox(height: 20),



              buttonApp(
                width: 400,
                height: 60,
                color: Colors.blue.shade600,
                text:  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(Icons.lock_open_outlined,color:ColorManager.white,),
                    SizedBox(width: 10,),
                    TextBoldApp(
                    text: 'تغيير كلمة المرور',
                    color: ColorManager.white,
                    sizeFont: 18,
              ),
                  ],

                ),)
            ],
          ),
        ),
      ),
    );
  }

  void _sendResetPasswordLink() {
    // Placeholder for sending reset password link logic
    print('Reset password link sent to ${_emailController.text}');
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
