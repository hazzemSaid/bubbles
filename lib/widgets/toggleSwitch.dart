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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
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
                  color: isEmailSelected
                      ? colorScheme.background
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: isEmailSelected
                      ? [
                          BoxShadow(
                            color: colorScheme.shadow.withAlpha(
                              51,
                            ), // 20% opacity
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
                  style: textTheme.bodyMedium?.copyWith(
                    color: isEmailSelected
                        ? colorScheme.primary
                        : colorScheme.onSurface,
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
                  color: !isEmailSelected
                      ? colorScheme.background
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: !isEmailSelected
                      ? [
                          BoxShadow(
                            color: colorScheme.shadow.withAlpha(
                              51,
                            ), // 20% opacity
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
                  style: textTheme.bodyMedium?.copyWith(
                    color: !isEmailSelected
                        ? colorScheme.primary
                        : colorScheme.onSurface,
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
