import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/widgets/CustomTextFromField.dart';
import 'package:bubbels/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bubbels/screens/affiliate_signup_screen.dart';

class AffiliateLogin extends StatefulWidget {
  const AffiliateLogin({super.key});
  static const String routeName = '/affiliate-login';

  @override
  State<AffiliateLogin> createState() => _AffiliateLoginState();
}

class _AffiliateLoginState extends State<AffiliateLogin> {
  final formKey = GlobalKey<FormState>();
  final companyIdController = TextEditingController();
  final userIdController = TextEditingController();

  @override
  void dispose() {
    companyIdController.dispose();
    userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      // Use AppBar for proper back button implementation
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.iconTheme.color, size: 24),
          onPressed: () => context.pop(),
          padding: EdgeInsets.all(12),
          constraints: BoxConstraints(), // Removes minimum size constraints
          splashRadius: 28,
        ),
        actions: [
          // Add theme toggle to AppBar actions
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: const ThemeToggleIcon(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                "Affiliates",
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 24.sp,
                  color: colorScheme.onSurface,
                ),
              ),

              SizedBox(height: 30.h),
              // Logo
              SizedBox(
                width: 150.w,
                height: 150.h,
                child: Center(
                  child: SizedBox(
                    width: 150.w,
                    height: 150.h,
                    child: Image.asset(
                      'assets/images/BubbleswithLogo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              // Form
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // Company ID field
                    CustomTextFromField(
                      keys: const PageStorageKey('companyId'),
                      controller: companyIdController,
                      hintText: 'Enter your Company ID',
                      LabelText: 'Company ID',
                      obscureText: false,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Company ID';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 15.h),

                    // User ID field
                    CustomTextFromField(
                      keys: const PageStorageKey('userId'),
                      controller: userIdController,
                      hintText: 'Enter your ID',
                      LabelText: 'Affiliate ID',
                      obscureText: false,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your ID';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.h),

              // Terms text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
                    children: [
                      const TextSpan(
                        text: 'By continuing you agree to the Bubbles ',
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: AppColors.luxorGold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: AppColors.luxorGold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // Continue button
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    // Perform login action
                    print('Affiliate login validated');
                    // TODO: Implement affiliate login logic
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8D832), // Yellow button
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Continue',
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              // Administrator button
              GestureDetector(
                onTap: () {
                  // TODO: Implement administrator login logic
                  print('Administrator login tapped');
                },
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF9726FF), // Purple button
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Administrator',
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              // Become Affiliates button
              GestureDetector(
                onTap: () {
                  // Navigate to affiliate signup page
                  context.push(AffiliateSignUp.routeName);
                },
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C3A8C), // Blue button
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Become Affiliates',
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
