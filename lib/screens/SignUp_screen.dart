import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/widgets/BuildSignupFormWidget.dart';
import 'package:bubbels/widgets/theme_toggle.dart';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 1.sh),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 5.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: 1.sw,
                        ), // Increased top margin
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
                    ),
                  ),
                ),
              ),
            ),

            // Theme toggle button positioned in top right with a larger tap area
            Positioned(
              top: 10.h,
              right: 10.w,
              child: Container(
                width: 48.w, // Larger width for easier tapping
                height: 48.h, // Larger height for easier tapping
                alignment: Alignment.center,
                child: const ThemeToggleIcon(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
