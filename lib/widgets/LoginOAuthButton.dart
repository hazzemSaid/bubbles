import 'package:bubbels/utils/constants.dart';
import 'package:flutter/material.dart';
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
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(0, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset('assets/images/google.svg', fit: BoxFit.fill),
        ),
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
