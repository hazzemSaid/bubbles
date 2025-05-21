import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/widgets/saved_state.dart';
import 'package:bubbels/widgets/toggleSwitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  Login({super.key});
  static const String routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final PageStorageBucket bucket = PageStorageBucket();
  bool isEmailSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 1.sh), // ScreenUtil height
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w, // Responsive horizontal padding
                  vertical: 30.h, // Responsive vertical padding
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.h, width: 1.sw), // Responsive spacing
                    SizedBox(
                      width: 90.w,
                      height: 90.h,
                      child: Image.asset(
                        'assets/images/logo1.png',
                        fit: BoxFit.fill,
                      ),
                    ),

                    SizedBox(height: 15.h), // Responsive height
                    Text(
                      "Welcome Back",
                      style: AppTextStyles.semanticHeading1.copyWith(
                        fontSize: 24.sp, // Responsive font size
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 8.h), // Responsive height
                    Text(
                      "Sign in to continue to your account",
                      style: AppTextStyles.interRegular.copyWith(
                        fontSize: 16.sp, // Responsive font size
                        color: AppColors.grayChateau,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.h), // Responsive height
                    ToggleSwitch(
                      isEmailSelected: isEmailSelected,
                      onToggle: (value) {
                        setState(() {
                          isEmailSelected = value;
                        });
                      },
                    ),
                    SizedBox(height: 15.h), // Responsive height
                    state_storage_widget(
                      bucket: bucket,
                      isEmailSelected: isEmailSelected,
                    ),
                    SizedBox(height: 15.h), // Responsive height
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
