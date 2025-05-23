import 'package:bubbels/bloc/auth/auth_cubit.dart';
import 'package:bubbels/utils/go_route.dart';
import 'package:bubbels/widgets/CustomTextFromField.dart';
import 'package:bubbels/widgets/LoginOAuthButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginWithEmailWidget extends StatefulWidget {
  const LoginWithEmailWidget({super.key});

  @override
  State<LoginWithEmailWidget> createState() => _LoginWithEmailWidgetState();
}

class _LoginWithEmailWidgetState extends State<LoginWithEmailWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: Column(
          children: [
            CustomTextFromField(
              keys: PageStorageKey('email'),
              LabelText: 'Email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              hintText: 'Enter your email',
              obscureText: false,
              textInputType: TextInputType.emailAddress,
              controller: emailController,
            ),
            SizedBox(height: 8.h),
            CustomTextFromField(
              keys: PageStorageKey('password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              LabelText: 'Password',
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
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  color: colorScheme.primary,
                ),
              ),
            ),
            SizedBox(height: 7.h),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(
                    context,
                  ).signIn(emailController.text, passwordController.text);
                }
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5.h),
                child: Text(
                  'Sign In',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoute.affiliateLogin.name);
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorScheme.onBackground,
                    width: 1.w,
                  ),
                  color: colorScheme.background,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5.h),
                child: Text(
                  'Login as Affiliate',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: Divider(color: colorScheme.outline, thickness: 1.h),
                ),
                SizedBox(width: 4.w),
                Text(
                  'Or continue with',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    color: colorScheme.outline,
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Divider(color: colorScheme.outline, thickness: 1.h),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            LoginOAuthButton(),
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: Divider(color: colorScheme.outline, thickness: 1.h),
                ),
                SizedBox(width: 4.w),
                Text(
                  'Or',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    color: colorScheme.outline,
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Divider(color: colorScheme.outline, thickness: 1.h),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                'continue as guest',
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  color: colorScheme.onSurface,
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
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    color: colorScheme.outline,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the sign-up screen
                    context.pushNamed(AppRoute.signup.name);
                  },
                  child: Text(
                    'Sign Up',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      color: colorScheme.primary,
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
