import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/widgets/CustomTextFromField.dart';
import 'package:bubbels/widgets/LoginOAuthButton.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneWidget extends StatefulWidget {
  LoginWithPhoneWidget({super.key});

  @override
  State<LoginWithPhoneWidget> createState() => _LoginWithPhoneWidgetState();
}

class _LoginWithPhoneWidgetState extends State<LoginWithPhoneWidget> {
  late final phoneController;
  late final formkey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController = TextEditingController();
    formkey = GlobalKey<FormState>();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
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
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Perform login action
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
            onTap: () {},
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
    );
  }
}
