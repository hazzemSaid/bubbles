import 'package:bubbels/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  CustomTextFromField({
    super.key,
    required this.keys,
    this.validator,
    required this.LabelText,
    required this.hintText,
    required this.obscureText,
    required this.textInputType,
    required this.controller,
  });
  final String? Function(String?)? validator;
  final String LabelText;
  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final keys;

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: AppColors.grayChateau, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: keys,
      keyboardType: textInputType,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
        labelText: LabelText,
        labelStyle: AppTextStyles.interRegular.copyWith(
          fontSize: 16,
          color: AppColors.doveGray,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.interRegular.copyWith(
          fontSize: 16,
          color: AppColors.doveGray,
        ),
      ),
    );
  }
}
