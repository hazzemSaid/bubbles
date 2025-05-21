import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/utils/go_route.dart';
import 'package:bubbels/widgets/CustomTextFromField.dart';
import 'package:bubbels/widgets/LoginOAuthButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginWithPhoneWidget extends StatefulWidget {
  LoginWithPhoneWidget({super.key});

  @override
  State<LoginWithPhoneWidget> createState() => _LoginWithPhoneWidgetState();
}

class _LoginWithPhoneWidgetState extends State<LoginWithPhoneWidget> {
  final formkey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: Column(
          children: [
            CustomTextFromField(
              keys: PageStorageKey('phone'),
              LabelText: 'Phone Number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              hintText: 'Enter your phone number',
              obscureText: false,
              textInputType: TextInputType.phone,
              controller: phoneController,
            ),
            SizedBox(height: 8.h),
            CustomTextFromField(
              keys: PageStorageKey('password'),
              LabelText: 'Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              hintText: 'Enter your password',
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
              controller: passwordController,
            ),
            SizedBox(height: 5.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: AppTextStyles.interRegular.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.luxorGold,
                ),
              ),
            ),
            SizedBox(height: 7.h),
            GestureDetector(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  // Perform login action
                  print('Phone: ${phoneController.text}');
                  print('Password: ${passwordController.text}');
                  // Add your authentication logic here
                }
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.luxorGold,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5.h),
                child: Text(
                  'Sign In',
                  style: AppTextStyles.interRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black, width: 1.w),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5.h),
                child: Text(
                  'Login as Affiliate',
                  style: AppTextStyles.interRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.grayChateau, thickness: 1.h),
                ),
                SizedBox(width: 4.w),
                Text(
                  'Or continue with',
                  style: AppTextStyles.interRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.grayChateau,
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Divider(color: AppColors.grayChateau, thickness: 1.h),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            LoginOAuthButton(),
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.grayChateau, thickness: 1.h),
                ),
                SizedBox(width: 4.w),
                Text(
                  'Or',
                  style: AppTextStyles.interRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.grayChateau,
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Divider(color: AppColors.grayChateau, thickness: 1.h),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                color: const Color.fromARGB(53, 195, 192, 192),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                'continue as guest',
                style: AppTextStyles.interRegular.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account? ',
                  style: AppTextStyles.interRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.grayChateau,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the sign-up screen
                    context.pushNamed(AppRoute.signup.name);
                  },
                  child: Text(
                    'Sign Up',
                    style: AppTextStyles.interRegular.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.luxorGold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
