import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/widgets/BuildSignupFormWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const String routeName = '/signup';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 1.sh),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.h, width: 1.sw),
                    Center(
                      child: SizedBox(
                        width: 90.w,
                        height: 90.h,
                        child: Image.asset(
                          'assets/images/logo1.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Center(
                      child: Text(
                        "Create Account",
                        style: AppTextStyles.semanticHeading1.copyWith(
                          fontSize: 24.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Center(
                      child: Text(
                        "Sign up to get started",
                        style: AppTextStyles.interRegular.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.grayChateau,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    const BuildSignupFormWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
