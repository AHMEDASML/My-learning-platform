import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/common/loading_app.dart';
import 'package:educational_platform/global/common/show_error_snackbar.dart';
import 'package:educational_platform/global/components/button_app.dart';
import 'package:educational_platform/global/components/custom_dropdown_field.dart';
import 'package:educational_platform/global/components/dived_widget.dart';
import 'package:educational_platform/global/components/icon_app_widget.dart';
import 'package:educational_platform/global/components/logo_app_icon.dart';
import 'package:educational_platform/global/components/text_widgt/text_app_slime.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/components/text_widgt/text_field_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/constants.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/auth/login/controller/login_controller.dart';
import 'package:educational_platform/modules/auth/login/screen/login_screen.dart';
import 'package:educational_platform/modules/auth/register/controller/register_controller.dart';
import 'package:educational_platform/modules/auth/register/view/widget/item_reg.dart';
import 'package:educational_platform/modules/layout/layout_screen.dart';
import 'package:educational_platform/modules/setting/widget/item_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final TextEditingController _numberController = TextEditingController();
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // String? _selectedCity;

  final RegisterController registerController = Get.put(RegisterController());


  final _formKey = GlobalKey<FormState>();

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
                  image: AssetImage(ImagesApp.backgroundReg),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: SlideTransition(
                  position: registerController.slideAnimation!,
                  child: FadeTransition(
                    opacity: registerController.opacityAnimation!,
                    child: Form(
                      key: registerController.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          logoAppIcon(),
                          const SizedBox(height: 50),
                          const Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: TextBoldApp(
                              text: 'إنشاء حساب',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: textSlime(
                              text: 'مرحبا! قم بالتسجيل للبدء .. !',
                            ),
                          ),
                          const SizedBox(height: 30),
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
                              keyboardType: TextInputType.phone,
                              controller: registerController.numberController,
                              isPassword: false,
                              hintText: '07 000000000',
                              labelText: '07 000000000',
                              fieldType: CustomFieldType.email,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'الرجاء ادخال الرقم بشكل صحيح';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              controller: registerController.nameController,
                              isPassword: false,
                              hintText: 'ادخل الاسم الكامل',
                              labelText: 'الأسم الكامل',
                              fieldType: CustomFieldType.name,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'هذا الحقل مطلوب';
                                }
                                if (value.length > 25) {
                                  return 'يجب ألا يتجاوز الاسم 25 حرفًا';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              controller: registerController.passwordController,
                              isPassword: true,
                              hintText: 'ادخل كلمة السر',
                              labelText: 'كلمة السر',
                              fieldType: CustomFieldType.password,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'الرجاء ادخال كلمة المرور';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),



                            Obx(() => DropdownButtonFormField<String>(
                              value: registerController.selectedCity.value.isEmpty ? null : registerController.selectedCity.value,
                              hint: const Text('اختر المدينة'),
                              items: registerController.cities
                                  .map((city) => DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                registerController.selectedCity.value = value!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء اختيار المدينة';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'اختر المدينة',
                                alignLabelWithHint: false,
                                hintStyle: const TextStyle(
                                  color: Color(0xFF9A9A9A),
                                  fontSize: 15,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: const BorderSide(color: Color(0xffDDF4FF)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: const BorderSide(color: Color(0xffDDF4FF)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: ColorManager.app1,
                                  ),
                                ),
                                filled: true,
                                fillColor: ColorManager.white,
                                contentPadding:
                                const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                              ),
                            )),

                            const SizedBox(
                              height: 20,
                            ),





                            CustomTextField(
                              keyboardType: TextInputType.text,
                              controller: registerController.addressController,
                              isPassword: true,
                              hintText: 'ادخل العنوان الخاص بك',
                              labelText: 'عنوان السكن',
                              fieldType: CustomFieldType.addrees,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'الرجاء ادخال العنوان';
                                }

                                return null;
                              },
                            ),


                            const SizedBox(
                              height: 20,
                            ),






                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Obx(
                                () => registerController.isLoading.isTrue
                                    ? loadingAppWidget()
                                    : buttonApp(
                                        borderRadius: 15,
                                        height: 50,
                                        onTap: () {
                                          if (registerController.formKey.currentState!.validate()) {
                                            registerController.registerUser(
                                              name:registerController.nameController.text ,
                                              address: registerController.addressController.text,
                                              context: context,
                                              city: registerController.selectedCity.value,
                                              password:registerController.passwordController.text ,
                                              phoneNumber: registerController.numberController.text,

                                            );
                                          } else {
                                            // showFormErrorSnackbar(context); // Implement this function
                                          }
                                        },
                                        color: ColorManager.app7,
                                        width: MediaQuery.of(context).size.width,
                                        text: TextBoldApp(
                                          text: 'إنشاء حساب',
                                          color: ColorManager.white,
                                          sizeFont: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(height: 20,),

                            textSlime(
                              text: 'نسيت كلمة المرور ؟',
                              color: const Color(0xFF0E86D4),
                              sizeFont: 12,
                              fontWeight: FontWeight.w400,
                            ),



                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ItemIconSetting(icon: FontAwesomeIcons.telegram,onTap: (){
                                  registerController.openTelegramChat();
                                },),
                                const SizedBox(
                                  width: 20,
                                ),

                                ItemIconSetting(icon: FontAwesomeIcons.whatsapp,onTap: (){
                                  registerController.openWhatsAppChat();
                                },),




                              ],
                            ),
                          ],
                        ),



                        SizedBox(height: 20,),

                        GestureDetector(
                          onTap: () {
                            // navigateAndFinish(context, const LoginScreen());
                            Get.offAll(LoginScreen());
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


                              const Text('تسجيل الدخول',style: TextStyle(
                                color: Color(0xFF0E86D4),
                                fontSize: 12,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.w700,
                                height: 0.12,
                              ),),


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
