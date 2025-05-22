import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/widgets/CustomTextFromField.dart';
import 'package:bubbels/widgets/LoginOAuthButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildSignupFormWidget extends StatefulWidget {
  const BuildSignupFormWidget({super.key});

  @override
  State<BuildSignupFormWidget> createState() => _BuildSignupFormWidgetState();
}

class _BuildSignupFormWidgetState extends State<BuildSignupFormWidget> {
  final formkey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isEmailSelected = true;
  final phoneController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Form(
      key: formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Toggle between Email and Phone
          Center(
            child: Container(
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.brightness == Brightness.dark
                    ? Colors.grey.shade800
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isEmailSelected = true;
                        });
                      },
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: isEmailSelected
                              ? theme.cardColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25.r),
                          boxShadow: isEmailSelected
                              ? [
                                  BoxShadow(
                                    color: theme.shadowColor.withOpacity(0.2),
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
                            color: isEmailSelected
                                ? AppColors.luxorGold
                                : colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isEmailSelected = false;
                        });
                      },
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: !isEmailSelected
                              ? theme.cardColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25.r),
                          boxShadow: !isEmailSelected
                              ? [
                                  BoxShadow(
                                    color: theme.shadowColor.withOpacity(0.2),
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
                                : colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // Full Name Field
          CustomTextFromField(
            keys: PageStorageKey('fullName'),
            LabelText: 'Full Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            hintText: 'Enter your full name',
            obscureText: false,
            textInputType: TextInputType.name,
            controller: fullNameController,
          ),
          SizedBox(height: 12.h),

          // Email or Phone Field
          if (isEmailSelected)
            CustomTextFromField(
              keys: PageStorageKey('emailSignup'),
              LabelText: 'Email Address',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              hintText: 'Enter your email address',
              obscureText: false,
              textInputType: TextInputType.emailAddress,
              controller: emailController,
            )
          else
            CustomTextFromField(
              keys: PageStorageKey('phoneSignup'),
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
          SizedBox(height: 12.h),

          // Password Fields
          CustomTextFromField(
            keys: PageStorageKey('passwordSignup'),
            LabelText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            hintText: 'Enter your password',
            obscureText: true,
            textInputType: TextInputType.visiblePassword,
            controller: passwordController,
          ),
          SizedBox(height: 12.h),

          CustomTextFromField(
            keys: PageStorageKey('confirmPasswordSignup'),
            LabelText: 'Confirm Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            hintText: 'Confirm your password',
            obscureText: true,
            textInputType: TextInputType.visiblePassword,
            controller: confirmPasswordController,
          ),
          SizedBox(height: 15.h),

          // Terms and Conditions
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'By continuing, you agree to Bubbles ',
                      style: AppTextStyles.interRegular.copyWith(
                        fontSize: 14.sp,
                        color: colorScheme.onSurface,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: AppTextStyles.interRegular.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.luxorGold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: colorScheme.onSurface),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: AppTextStyles.interRegular.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.luxorGold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),

          // Sign Up Button
          GestureDetector(
            onTap: () {
              if (formkey.currentState!.validate()) {
                // Perform sign up action
                print(
                  'Sign Up with ${isEmailSelected ? "Email" : "Phone"} validated',
                );
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
              child: Text(
                'Sign Up',
                style: AppTextStyles.interRegular.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // Login as Affiliate Button
          GestureDetector(
            onTap: () {
              // Handle affiliate login
            },
            child: Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.onSurface, width: 1.w),
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.center,
              child: Text(
                'Login as Affiliate',
                style: AppTextStyles.interRegular.copyWith(
                  fontSize: 16.sp,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // Or continue with
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: colorScheme.onSurface.withOpacity(0.3),
                  thickness: 1.h,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Or continue with',
                style: AppTextStyles.interRegular.copyWith(
                  fontSize: 14.sp,
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Divider(
                  color: colorScheme.onSurface.withOpacity(0.3),
                  thickness: 1.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),

          // OAuth Buttons
          LoginOAuthButton(),
          SizedBox(height: 20.h),

          // Already have an account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: AppTextStyles.interRegular.copyWith(
                  fontSize: 16.sp,
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate back to login
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Sign In',
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
    );
  }
}
