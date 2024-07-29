import 'package:flutter/material.dart';
import 'package:educational_platform/global/components/button_app.dart';
import 'package:educational_platform/global/components/icon_app_widget.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';

class CardDistributors extends StatelessWidget {
  const CardDistributors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 100,
        child: Card(
          color: Color(0xffF2F7FD),
          elevation: 2.0,
          shadowColor: ColorManager.grey.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                Text(
                  'مكتبة القصور',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF055C9D),
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),

                SizedBox(height: 10,),

                Text(
                  '+963992086301',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF0E86D4),
                    fontSize: 14,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),



              ]),



              Row(children: [

                iconAppWidgetLesan(
                    icon: Icons.call_outlined,
                    color: ColorManager.app7,
                     ),

                iconAppWidgetLesan(
                    icon: Icons.map,
                    color: ColorManager.app7,
                  ),

                iconAppWidgetLesan(
                    icon: Icons.maps_ugc_outlined,
                    color: ColorManager.app7,
                     ),



              ],)


            ],
          ),
        ),
      ),
    );
  }
}
