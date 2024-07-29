import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/data/local/cache_helper.dart';
import 'package:educational_platform/global/utils/key_shared.dart';
import 'package:educational_platform/modules/auth/register/model/reg_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:educational_platform/modules/layout/layout_screen.dart';
import 'package:educational_platform/modules/auth/register/view/screen/register_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController with SingleGetTickerProviderMixin {
  late TextEditingController numberController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>().obs;
  AnimationController? animationController;
  Animation<double>? opacityAnimation;
  Animation<Offset>? slideAnimation;
  RegModel? regModel;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    numberController = TextEditingController();
    passwordController = TextEditingController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeInOut));
    slideAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.easeInOut));

    animationController!.forward();
  }


  void openTelegramChat() async {
    const telegramUrl = "https://t.me/Ahmedasml";
    if (await canLaunch(telegramUrl)) {
      await launch(telegramUrl);
    } else {
      throw 'Could not launch $telegramUrl';
    }
  }

  void openWhatsAppChat() async {
    const whatsappNumber = '07840405533';
    const url = 'https://wa.me/$whatsappNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch WhatsApp');
    }
  }



  @override
  void onClose() {
    animationController!.dispose();
    numberController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void navigateToLogin() {
    Get.to(() => const LayoutScreen());
  }

  void navigateToRegister() {
    Get.to(() => const RegisterScreen());
  }


  void login({required BuildContext context}) async {
    isLoading.value = true;
    if (!formKey.value.currentState!.validate()) {
      return;
    }
    formKey.value.currentState!.save();

    // Prepare data for Dio request
    final data = json.encode({
      'phone_number': numberController.text,
      'password': passwordController.text,
    });

    print('numberController');
    print(numberController.text);
    print(passwordController.text);
    var dio = Dio();
    var response = await dio.request(
      'https://munastiedu.com/api/login',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));

      regModel = RegModel.fromJson(response.data);


      await CacheHelper.saveData(key: TOKEN, value: regModel!.data.token);
      await CacheHelper.saveData(key: 'NumberUnified', value: regModel!.data.numberUnified);
      await CacheHelper.saveData(
          key: NAMEUSER, value: regModel!.data.name);

      navigateAndFinish(context,const LayoutScreen());
      isLoading.value = false;
    }
    else {
      print(response.statusMessage);
      isLoading.value = false;
    }
  }



  void showFormErrorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('يجب تعبئة كل الحقول بشكل صحيح')),
    );
  }





}
