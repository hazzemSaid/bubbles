import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/widgets/saved_state.dart';
import 'package:bubbels/widgets/toggleSwitch.dart';
import 'package:flutter/material.dart';

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
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: height),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30, width: width),
                    Image.asset(
                      'assets/images/logo1.png',
                      height: height * 0.1,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Welcome Back",
                      style: AppTextStyles.semanticHeading1.copyWith(
                        fontSize: 24,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Sign in to continue to your account",
                      style: AppTextStyles.interRegular.copyWith(
                        fontSize: 16,
                        color: AppColors.grayChateau,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ToggleSwitch(
                      isEmailSelected: isEmailSelected,
                      onToggle: (value) {
                        setState(() {
                          isEmailSelected = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    state_storage_widget(
                      bucket: bucket,
                      isEmailSelected: isEmailSelected,
                    ),

                    const SizedBox(height: 20),
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
