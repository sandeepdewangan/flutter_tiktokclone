import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiktok_clone/constants.dart';

import 'widget/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Desi Flips",
              style: TextStyle(
                fontSize: 28,
                color: myRed,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _emailController,
              labelText: "Enter Email",
              myicon: Icons.email,
              obscureText: false,
            ),
            CustomTextField(
              controller: _passwordController,
              labelText: "Enter Password",
              myicon: Icons.password,
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {},
              color: myRed,
              child: const Text("Login"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have account? "),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: myRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
