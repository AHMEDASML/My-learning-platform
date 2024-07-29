import 'package:educational_platform/global/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:educational_platform/global/utils/color_app.dart'; // Assuming this contains ColorManager.app7

class CustomDropdownField extends StatefulWidget {
  final String? labelText;
  final CustomFieldType fieldType;
  final Function(String)? onSelected;

  const CustomDropdownField({
    Key? key,
    this.labelText,
    this.fieldType = CustomFieldType.name, this.onSelected,
  }) : super(key: key);

  @override
  _CustomDropdownFieldState createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? _selectedGovernorate;
  final List<String> _governorates = [
    'بابل',
    'الموصل',
    'الكوت',
    'الناصرية',
    'السماوة',
    'العمارة',
    'البصرة',
    'الديوانية',
    'الانبار',
    'صلاح الدين',
    'بغداد',
    'أربيل',
    'كركوك',
    'السليمانية',
    'النجف',
    'كربلاء',
    'دهوك',
    'ديالى',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedGovernorate,
      decoration: InputDecoration(
        hintText: widget.labelText ?? '',
        // labelText: widget.labelText ?? '',
        labelStyle: TextStyle(color: ColorManager.app7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      ),
      onChanged: (String? newValue) {
        setState(() {
          _selectedGovernorate = newValue;
        });
        if (newValue != null && widget.onSelected != null) {
          widget.onSelected!(newValue); // Call the callback with the new value
        }
      },
      items: _governorates.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
