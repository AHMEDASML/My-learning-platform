import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final CustomFieldType fieldType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;




  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.fieldType = CustomFieldType.name,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  void dispose() {
    // widget.controller!.dispose();
    super.dispose();
  }

  Icon? getPrefixIcon() {
    switch (widget.fieldType) {
      case CustomFieldType.email:
        return Icon(Icons.call, color: ColorManager.white);
      case CustomFieldType.name:
        return Icon(Icons.person, color: ColorManager.white);
      case CustomFieldType.password:
        return Icon(Icons.lock, color: ColorManager.white);
        case CustomFieldType.addrees:
        return Icon(Icons.maps_home_work_outlined, color: ColorManager.white);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.07),
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        // textAlign: TextAlign.end,
        controller: widget.controller,
        obscureText: widget.isPassword && _obscureText,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        style: const TextStyle(color: Color(0xff055C9D), fontSize: 16),
        decoration: InputDecoration(
          hintText: widget.hintText ?? '',
          alignLabelWithHint: false,
          hintStyle: const TextStyle(
            color: Color(0xFF9A9A9A),
            fontSize: 15,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          prefixIcon: getPrefixIcon(),
          suffixIcon: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xff055C9D),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),
            ),
            child: getPrefixIcon(),
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
      ),
    );
  }
}
