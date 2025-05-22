import 'package:bubbels/widgets/saved_state.dart';
import 'package:bubbels/widgets/theme_toggle.dart';
import 'package:bubbels/widgets/toggleSwitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final PageStorageBucket bucket = PageStorageBucket();
  bool isEmailSelected = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.scaffoldBackgroundColor;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme,
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
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: 1.sw,
                        ), // Increased top margin
                        SizedBox(
                          width: 90.w,
                          height: 90.h,
                          child: Image.asset(
                            'assets/images/logo1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "Welcome Back",
                          style: textTheme.headlineSmall?.copyWith(
                            fontSize: 24.sp,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Sign in to continue to your account",
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: 16.sp,
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.h),
                        ToggleSwitch(
                          isEmailSelected: isEmailSelected,
                          onToggle: (value) {
                            setState(() {
                              isEmailSelected = value;
                            });
                          },
                        ),
                        SizedBox(height: 15.h),
                        state_storage_widget(
                          bucket: bucket,
                          isEmailSelected: isEmailSelected,
                        ),
                        SizedBox(height: 15.h),
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
