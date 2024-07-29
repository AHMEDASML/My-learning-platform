import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/components/app_bar_app.dart';
import 'package:educational_platform/modules/setting/Privacy/view/privacy_screen.dart';
import 'package:educational_platform/modules/setting/usage_policy/view/screen/usage_policy_screen.dart';
import 'package:educational_platform/modules/setting/widget/item_setting.dart';
import 'package:flutter/material.dart';

class SettingsAdditional extends StatefulWidget {
  const SettingsAdditional({Key? key}) : super(key: key);

  @override
  State<SettingsAdditional> createState() => _SettingsAdditionalState();
}

class _SettingsAdditionalState extends State<SettingsAdditional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const AppBarApp(
        text: 'الأعدادات',
      ),

      body: Column(
        children: [

          ItemSetting(name: 'الخصوصية',  onTap: (){
            navigateTo(context,const PrivacyScreen());

          }),

          ItemSetting(name: 'سياسة الاستخدام',  onTap: (){
            navigateTo(context,const UsagePolicyScreen());

          }),
        ],
      ),


    );
  }
}
