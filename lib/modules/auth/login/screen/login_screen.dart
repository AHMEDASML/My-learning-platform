import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/common/loading_app.dart';
import 'package:educational_platform/global/common/show_error_snackbar.dart';
import 'package:educational_platform/global/components/button_app.dart';
import 'package:educational_platform/global/components/dived_widget.dart';
import 'package:educational_platform/global/components/icon_app_widget.dart';
import 'package:educational_platform/global/components/logo_app_icon.dart';
import 'package:educational_platform/global/components/text_widgt/text_app_slime.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/components/text_widgt/text_field_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/constants.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/auth/login/controller/login_controller.dart';
import 'package:educational_platform/modules/auth/register/view/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 30),
            curve: Curves.easeInOut,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagesApp.backgroundLogin),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: SlideTransition(
                  position: loginController.slideAnimation!,
                  child: FadeTransition(
                    opacity: loginController.opacityAnimation!,
                    child: Form(
                      key: loginController.formKey.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          logoAppIcon(),
                          const SizedBox(height: 50),
                          const Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: TextBoldApp(
                              text: 'تسجيل الدخول ',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: textSlime(
                              text: 'مرحبا بكم مرة أخرى في منصتي التعليمية ..!',
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            divedApp(
                                context: context, height: 2, color: Colors.black),
                            const SizedBox(
                              height: 50,
                            ),
                    
                    
                            CustomTextField(
                              controller: loginController.numberController,
                              isPassword: false,
                              hintText: 'ادخل رقم الهاتف',
                              labelText: 'رقم الهاتف',
                              fieldType: CustomFieldType.email,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء إدخال رقم الهاتف';
                                } else if (value.length != 11) {
                                  return 'يجب أن يكون رقم الهاتف مكون من 11 رقم';
                                }
                                return null;
                              },
                            ),
                    
                    
                    
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: loginController.passwordController,
                              isPassword: true,
                              hintText: 'ادخل كلمة المرور',
                              labelText: 'كلمة المرور',
                              fieldType: CustomFieldType.password,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'هذا الحقل مطلوب';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            textSlime(
                              text: 'نسيت كلمة المرور ؟',
                              color: const Color(0xFF0E86D4),
                              sizeFont: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              child: Obx(
                                () => loginController.isLoading.isTrue
                                    ? loadingAppWidget()
                                    : buttonApp(
                                        borderRadius: 15,
                                        height: 50,
                                        onTap: () {
                                          if (loginController
                                              .formKey.value.currentState!
                                              .validate()) {
                                            loginController.login(context: context);
                                          } else {
                                            showFormErrorSnackbar(context);
                                          }
                                        },
                                        color: ColorManager.app7,
                                        width: MediaQuery.of(context).size.width,
                                        text: TextBoldApp(
                                          text: 'تسجيل الدخول',
                                          color: ColorManager.white,
                                          sizeFont: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {
                            //         loginController.openTelegramChat();
                            //       },
                            //       child: SizedBox(
                            //         width: 37,
                            //         height: 37,
                            //         child: ClipRRect(
                            //             borderRadius: BorderRadius.circular(30),
                            //             child: Image.asset(ImagesApp.telegam)),
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       width: 20,
                            //     ),
                            //     GestureDetector(
                            //       onTap: () {
                            //         loginController.openWhatsAppChat();
                            //       },
                            //       child: SizedBox(
                            //         width: 37,
                            //         height: 37,
                            //         child: ClipRRect(
                            //             borderRadius: BorderRadius.circular(20),
                            //             child: Image.asset(ImagesApp.wh)),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            // navigateAndFinish(context,RegisterScreen());
                            Get.offAll(RegisterScreen());
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textSlime(
                                color: const Color(0xFF8D9091),
                                sizeFont: 12,
                                fontWeight: FontWeight.w400,
                                text: 'ليس لديك أي حساب ؟',
                              ),
                              const SizedBox(
                                width: 1,
                              ),
                              const TextBoldApp(
                                text: 'إنشاء حساب',
                                fontWeight: FontWeight.w700,
                                sizeFont: 12,
                                color: Color(0xFF0E86D4),
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
