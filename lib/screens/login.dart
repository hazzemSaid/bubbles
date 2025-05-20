import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: const Text('Login')),
      ),
    );
  }
}
