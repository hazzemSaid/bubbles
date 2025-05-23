import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingWidgetAnimation extends StatelessWidget {
  const LoadingWidgetAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/loading_animatoin.json',
        width: 300.w,
        height: 200.h,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
