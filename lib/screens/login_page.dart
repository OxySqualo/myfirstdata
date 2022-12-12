import 'package:flutter/material.dart';
import 'package:myfirstdata/helpers/help.dart';
import 'package:myfirstdata/screens/forgot_password_page.dart';

import '../models/decoration.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
              textInputAction: TextInputAction.done,
              obscureText: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ForgotPasswordScreen();
                  }));
                },
                child: const Text('Forgot password?'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
                child: const Text('Firstly here? Sign up!'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              final email = _emailController.text;
              final password = _passwordController.text;
              final success = await FirebaseHelper.login(email, password);
              if (success) {
                Navigator.pushReplacementNamed(context, '/profile');
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text('Wrong email or password'),
                      );
                    });
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
