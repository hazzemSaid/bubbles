import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/widgets/BuildSignupFormWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpContent extends StatelessWidget {
  const SignUpContent();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40.h, width: 1.sw),
        Center(
          child: SizedBox(
            width: 90.w,
            height: 90.h,
            child: Image.asset('assets/images/logo1.png', fit: BoxFit.fill),
          ),
        ),
        SizedBox(height: 15.h),
        Center(
          child: Text(
            "Create Account",
            style: AppTextStyles.semanticHeading1.copyWith(
              fontSize: 24.sp,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Center(
          child: Text(
            "Sign up to get started",
            style: AppTextStyles.interRegular.copyWith(
              fontSize: 16.sp,
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 15.h),
        const BuildSignupFormWidget(),
      ],
    );
  }
}
