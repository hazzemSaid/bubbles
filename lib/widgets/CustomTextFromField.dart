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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: theme.brightness == Brightness.dark
            ? colorScheme.onSurface.withOpacity(0.3)
            : AppColors.grayChateau,
        width: 2,
      ),
    );

    return TextFormField(
      key: keys,
      keyboardType: textInputType,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: colorScheme.onSurface),
      decoration: InputDecoration(
        filled: theme.brightness == Brightness.dark,
        fillColor: theme.brightness == Brightness.dark
            ? theme.inputDecorationTheme.fillColor ?? colorScheme.surface
            : null,
        border: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: AppColors.luxorGold, width: 2),
        ),
        enabledBorder: border,
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
        ),
        labelText: LabelText,
        labelStyle: AppTextStyles.interRegular.copyWith(
          fontSize: 16,
          color: colorScheme.onSurface.withOpacity(0.7),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.interRegular.copyWith(
          fontSize: 16,
          color: colorScheme.onSurface.withOpacity(0.5),
        ),
      ),
    );
  }
}
