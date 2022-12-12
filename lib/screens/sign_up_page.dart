import 'package:flutter/material.dart';
import 'package:myfirstdata/helpers/help.dart';

import '../models/decoration.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'e-mail',
                fillColor: fillColorLightBlue,
                filled: true,
                enabledBorder: enabledBorder(),
                focusedBorder: focusedBorder(),
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'password',
                fillColor: fillColorLightBlue,
                filled: true,
                enabledBorder: enabledBorder(),
                focusedBorder: focusedBorder(),
              ),
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _passwordAgainController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password again',
                fillColor: fillColorLightBlue,
                filled: true,
                enabledBorder: enabledBorder(),
                focusedBorder: focusedBorder(),
              ),
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final email = _emailController.text;
              final password = _passwordController.text;
              final passwordAgain = _passwordAgainController.text;
              if (password == passwordAgain) {
                final success = await FirebaseHelper.signUp(email, password);
                if (success) {
                  Navigator.pop(context);
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Something went wrong'),
                        );
                      });
                }
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text('Passwords are not the same'),
                      );
                    });
              }
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
