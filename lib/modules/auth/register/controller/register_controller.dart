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

class RegisterController extends GetxController
    with SingleGetTickerProviderMixin {
  late TextEditingController numberController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController addressController;
  RxBool isLoading = false.obs;
  AnimationController? animationController;
  Animation<double>? opacityAnimation;
  Animation<Offset>? slideAnimation;
  RegModel? regModel;
  var selectedCity = ''.obs;
  final List<String> cities = [

    'بغداد',
    'الأنبار',
    'بابل',
    'البصرة',
    'كربلاء',
    'دهوك',
    'ديالى',
    'ذي قار',
    'السليمانية',
    'صلاح الدين',
    'القادسية',
    'كركوك',
    'ميسان',
    'النجف',
    'نينوى',
    'المثنى',
    'واسط',
    'أربيل'


  ];
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    numberController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    addressController = TextEditingController();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeInOut));
    slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOut));

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
    const whatsappNumber = '+352681601874';
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
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void navigateToLogin() {
    Get.to(() => const LayoutScreen());
  }

  void navigateToRegister() {
    Get.to(() => const RegisterScreen());
  }

  void registerUser(
  {required String name,required String phoneNumber,required String password,required String address,required String city,required BuildContext context}) async {
    isLoading.value = true;

    final data = json.encode({
      'name': name,
      'phone_number': phoneNumber,
      'password': password,
      'city': city,
      'address': address

    });

    var dio = Dio();
    try {
      var response = await dio.post(
        'https://munastiedu.com/api/register',
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));

        regModel = RegModel.fromJson(response.data);


        await CacheHelper.saveData(key: TOKEN, value: regModel!.data.token);

        await CacheHelper.saveData(
            key: NAMEUSER, value: regModel!.data.name);
        await CacheHelper.saveData(key: 'NumberUnified', value: regModel!.data.numberUnified);


        navigateAndFinish(context,LayoutScreen());

      } else {
        print('Error: ${response.statusMessage}');
        // Show error message
      }
    } catch (e) {
      print('Exception caught: $e');
      // Handle exception
    } finally {
      isLoading.value = false; // Hide loader
    }
  }
}
