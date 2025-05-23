import 'package:bubbels/bloc/auth/auth_cubit.dart';
import 'package:bubbels/bloc/auth/auth_state.dart';
import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/utils/snackbar_helper.dart';
import 'package:bubbels/widgets/BuildSignupFormWidget.dart';
import 'package:bubbels/widgets/LoadingWidgetAnimation.dart';
import 'package:bubbels/widgets/SignUpContent.dart';
import 'package:bubbels/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static const String routeName = '/signup';

  void _handleAuthState(BuildContext context, AuthState state) {
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
        message: "Account created successfully",
        backgroundColor: Colors.green,
        textColor: Theme.of(context).colorScheme.onPrimary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 1.sh),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 5.h,
                    ),
                    child: BlocListener<AuthCubit, AuthState>(
                      listener: _handleAuthState,
                      child: const SignUpContent(),
                    ),
                  ),
                ),
              ),
            ),

            // Theme toggle in top right
            Positioned(
              top: 10.h,
              right: 10.w,
              child: SizedBox(
                width: 48.w,
                height: 48.h,
                child: const ThemeToggleIcon(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
