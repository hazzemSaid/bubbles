import 'package:bubbels/bloc/auth/auth_cubit.dart';
import 'package:bubbels/bloc/auth/auth_state.dart';
import 'package:bubbels/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginOAuthButton extends StatelessWidget {
  const LoginOAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Google Sign-In Button
        GestureDetector(
          onTap: () {
            BlocProvider.of<AuthCubit>(context).signInWithGoogle();
          },
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(0, 255, 255, 255),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              'assets/images/google.svg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Facebook Button (not implemented yet)
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(0, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            'assets/images/facebook.svg',
            fit: BoxFit.fill,
          ),
        ),
        // Apple Button (not implemented yet)
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(0, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset('assets/images/apple.svg', fit: BoxFit.fill),
        ),
      ],
    );
  }
}
