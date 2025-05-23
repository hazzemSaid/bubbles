import 'package:bubbels/bloc/auth/auth_cubit.dart';
import 'package:bubbels/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),

        actions: [
          // Add theme toggle to AppBar actions
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: const ThemeToggleIcon(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).signOut();
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Lottie.asset(
          'assets/animations/loading_animatoin.json',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
