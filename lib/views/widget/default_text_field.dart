import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../utils/style/app_colors.dart';

class DefaultTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Color? prefixIconColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FocusNode? focusNode;
  const DefaultTextField(
      {super.key,
      this.onChanged,
      this.onTap,
      this.controller,
      this.labelText,
      this.prefixIconColor,
      this.fontSize,
      this.hintText,
      this.fontWeight,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
          prefixIconColor: prefixIconColor,
          hintText: hintText,
          helperStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppTheme.textColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppTheme.basieColor),
          )),
    );
  }
}
