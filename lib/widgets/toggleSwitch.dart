import 'package:bubbels/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleSwitch extends StatelessWidget {
  final bool isEmailSelected;
  final Function(bool) onToggle;

  const ToggleSwitch({
    super.key,
    required this.isEmailSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(true),
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  color: isEmailSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: isEmailSelected
                      ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 1),
                          ),
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: isEmailSelected ? AppColors.luxorGold : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(false),
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  color: !isEmailSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: !isEmailSelected
                      ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 1),
                          ),
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Phone',
                  style: TextStyle(
                    color: !isEmailSelected
                        ? AppColors.luxorGold
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
