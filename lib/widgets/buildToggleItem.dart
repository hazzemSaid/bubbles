import 'package:bubbels/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildToggleItem(
  BuildContext context,
  bool value,
  String label,
  bool isEmailSelected,
  Function(bool) onToggle,
) {
  final isSelected = value == isEmailSelected;
  return Expanded(
    child: GestureDetector(
      onTap: () => onToggle(value),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.horizontal(
            left: value ? Radius.circular(30.r) : Radius.zero,
            right: !value ? Radius.circular(30.r) : Radius.zero,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4.r,
                    offset: Offset(0, 2.h),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppTextStyles.interRegular.copyWith(
            fontSize: 16.sp,
            color: isSelected ? AppColors.black : Colors.black54,
          ),
        ),
      ),
    ),
  );
}
