
import 'package:educational_platform/global/components/dived_widget.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:flutter/material.dart';

class ItemSetting extends StatelessWidget {
  final String name;
  final bool last;
  final void Function()? onTap;


  const ItemSetting({Key? key,this.last=true, required this.name, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(

        highlightColor: const Color(0xffE4F0F4),
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                TextBoldApp(text:name,
                  sizeFont: 15,
                  color: const Color(0xFF055C9D),
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(width: 20,),
                const Icon(Icons.arrow_forward_ios,color: Color(0xFF055C9D),size: 18,),
              ],),
            ),

          ],
        ),
      ),
    );
  }
}


class ItemIconSetting extends StatelessWidget {

  final IconData icon;
  final void Function()? onTap;
  const ItemIconSetting({Key? key, required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: const Color(0xFF055C9D),
        child: Icon(icon,color: Colors.white,),
      ),
    );
  }
}

