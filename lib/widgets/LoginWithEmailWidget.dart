import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/widgets/CustomTextFromField.dart';
import 'package:bubbels/widgets/LoginOAuthButton.dart';
import 'package:flutter/material.dart';

class LoginWithEmailWidget extends StatefulWidget {
  const LoginWithEmailWidget({super.key});

  @override
  State<LoginWithEmailWidget> createState() => _LoginWithEmailWidgetState();
}

class _LoginWithEmailWidgetState extends State<LoginWithEmailWidget> {
  final formkey = GlobalKey<FormState>();
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
    return Form(
      key: formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
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
            SizedBox(height: 20),
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
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: AppTextStyles.interRegular.copyWith(
                  fontSize: 16,
                  color: AppColors.luxorGold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  // Perform login action
                  print('Email: ${emailController.text}');
                  print('Password: ${passwordController.text}');
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.luxorGold,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  'Sign In',
                  style: AppTextStyles.interRegular.copyWith(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  // Perform login action
                  print('Email: ${emailController.text}');
                  print('Password: ${passwordController.text}');
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black, width: 3),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  'Login as Affiliate',
                  style: AppTextStyles.interRegular.copyWith(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.grayChateau, thickness: 1),
                ),
                const SizedBox(width: 4),
                Text(
                  'Or continue with',
                  style: AppTextStyles.interRegular.copyWith(
                    fontSize: 16,
                    color: AppColors.grayChateau,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Divider(color: AppColors.grayChateau, thickness: 1),
                ),
              ],
            ),
            const SizedBox(height: 20),
            LoginOAuthButton(),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.grayChateau, thickness: 1),
                ),
                const SizedBox(width: 4),
                Text(
                  'Or',
                  style: AppTextStyles.interRegular.copyWith(
                    fontSize: 16,
                    color: AppColors.grayChateau,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Divider(color: AppColors.grayChateau, thickness: 1),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(53, 195, 192, 192),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'continue as guest',
                style: AppTextStyles.interRegular.copyWith(
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account? ',
                  style: AppTextStyles.interRegular.copyWith(
                    fontSize: 16,
                    color: AppColors.grayChateau,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the sign-up screen
                  },
                  child: Text(
                    'Sign Up',
                    style: AppTextStyles.interRegular.copyWith(
                      fontSize: 16,
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
