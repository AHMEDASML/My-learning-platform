import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/data/local/cache_helper.dart';
import 'package:educational_platform/global/utils/color_app.dart';

import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/global/utils/key_shared.dart';
import 'package:educational_platform/modules/auth/login/controller/login_controller.dart';
import 'package:educational_platform/modules/auth/login/screen/login_screen.dart';
import 'package:educational_platform/modules/auth/register/view/widget/item_reg.dart';
import 'package:educational_platform/modules/layout/page_screen/setting/view/screen/settings_additional.dart';
import 'package:educational_platform/modules/setting/Privacy/view/privacy_screen.dart';
import 'package:educational_platform/modules/setting/usage_policy/view/screen/usage_policy_screen.dart';
import 'package:educational_platform/modules/setting/widget/item_setting.dart';
import 'package:educational_platform/modules/setting/widget/show_confirm_dialog.dart';
import 'package:educational_platform/modules/setting_screen/change_password/view/screen/change_password.dart';
import 'package:educational_platform/modules/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        children: [

          Stack(
            alignment: AlignmentDirectional.center,
            children: [

              Image.asset(ImagesApp.backgroundSetting,width: MediaQuery.of(context).size.width,),

              const Center(
                child: Text(
                  'الملف الشخصي',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),


            Column(children: [

              const SizedBox(height: 30,),


              ItemSetting(name: 'تغيير كلمة المرور' ,onTap: (){

                navigateTo(context,const ForgotPasswordPage());
              }),



              ItemSetting(name: 'الإعدادات' ,onTap: (){

                navigateTo(context,  const SettingsAdditional());
              }),



              ItemSetting(name: 'حذف الحساب' ,
                onTap: () {
                  showConfirmDialog(
                    context,
                    'حذف الحساب',
                    'هل أنت متأكد من رغبتك في حذف الحساب؟ هذه العملية لا رجعة فيها.',
                        () {
                      // إضافة العملية الخاصة بحذف الحساب هنا
                    },
                  );
                },

              ),
              ItemSetting(last: false, name: 'تسجيل الخروج' ,

                onTap: () {
                  showConfirmDialog(
                    context,
                    'هل تريد تأكيد تسجيل الخروج ؟',
                    'أنت على وشك الخروج',
                        () {

                          CacheHelper.removeData(key: TOKEN);
                          CacheHelper.removeData(key: NAMEUSER);


                          navigateAndFinish(context,const LoginScreen());

                    },
                  );
                },

              ),
            ]),

            const SizedBox(height: 50,),





            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: Row(
                  children: [
                ItemIconSetting(icon: FontAwesomeIcons.telegram,onTap: (){
                  openUrl("https://t.me/AhmedDA98");
                },),

                const SizedBox(width: 20,),
                ItemIconSetting(icon: FontAwesomeIcons.facebookF,onTap: (){
                  openUrl("https://www.facebook.com/ahmed.dose.756/e");
                },),
                    const SizedBox(width: 20,),

                ItemIconSetting(icon: FontAwesomeIcons.instagram,onTap: (){
                  openUrl("https://t.me/AhmedDA98");
                },),
                    const SizedBox(width: 20,),
                ItemIconSetting(icon: FontAwesomeIcons.youtube,onTap: (){
                  openUrl("https://www.youtube.com/");
                },),
                    const SizedBox(width: 20,),

              ]),
            ),
        ],
      ),
    );
  }


  void openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}







