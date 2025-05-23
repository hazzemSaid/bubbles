import 'package:bubbels/bloc/auth/auth_cubit.dart';
import 'package:bubbels/bloc/auth/auth_state.dart';
import 'package:bubbels/utils/snackbar_helper.dart';
import 'package:bubbels/widgets/LoadingWidgetAnimation.dart';
import 'package:bubbels/widgets/saved_state.dart';
import 'package:bubbels/widgets/theme_toggle.dart';
import 'package:bubbels/widgets/toggleSwitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    child: contentLoginWidget(
                      textTheme: textTheme,
                      theme: theme,
                      isEmailSelected: isEmailSelected,
                      bucket: bucket,
                      onToggle: (value) {
                        setState(() {
                          isEmailSelected = value;
                        });
                      },
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

class contentLoginWidget extends StatelessWidget {
  const contentLoginWidget({
    super.key,
    required this.textTheme,
    required this.theme,
    required this.isEmailSelected,
    required this.bucket,
    required this.onToggle,
  });
  final dynamic Function(bool) onToggle;
  final TextTheme textTheme;
  final ThemeData theme;
  final bool isEmailSelected;
  final PageStorageBucket bucket;

  void listener(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const LoadingWidgetAnimation(),
      );
    } else if (state is AuthFailure) {
      if (Navigator.canPop(context)) Navigator.of(context).pop();
      final theme = Theme.of(context);
      SnackBarHelper.showSnackBar(
        context: context,
        message: state.error,
        backgroundColor: Colors.red,
        textColor: theme.colorScheme.onError,
      );
    } else if (state is AuthSuccess) {
      if (Navigator.canPop(context)) Navigator.of(context).pop();
      SnackBarHelper.showSnackBar(
        context: context,
        message: "sign in successfully",
        backgroundColor: Colors.green,
        textColor: Theme.of(context).colorScheme.onPrimary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: listener,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h, width: 1.sw), // Increased top margin
          SizedBox(
            width: 90.w,
            height: 90.h,
            child: Image.asset('assets/images/logo1.png', fit: BoxFit.fill),
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
          ToggleSwitch(isEmailSelected: isEmailSelected, onToggle: onToggle),
          SizedBox(height: 15.h),
          state_storage_widget(
            bucket: bucket,
            isEmailSelected: isEmailSelected,
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
