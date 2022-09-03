import 'package:f_testing/models/validator.dart';
import 'package:flutter/material.dart';

import 'home.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final GlobalKey<FormState> key = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: key,
        child: Column(
          children: [
            TextFormField(
              key: const ValueKey('email_id'),
              decoration: const InputDecoration(labelText: 'Email'),
              controller: emailController,
              validator: (value) => Validator.validarMail(value ?? ''),
            ),
            TextFormField(
              key: const ValueKey('password_id'),
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              controller: passwordController,
              validator: (value) => Validator.validarPassword(value ?? ''),
            ),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
