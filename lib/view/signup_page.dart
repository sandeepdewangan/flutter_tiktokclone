import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';

import 'widget/custom_text_field.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
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
              "Register",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 54,
                  backgroundImage: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                  ),
                ),
                Positioned(
                    bottom: -10,
                    right: 4,
                    child: IconButton(
                      onPressed: () => AuthController.instance.pickImage(),
                      icon: const Icon(Icons.add_a_photo),
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _usernameController,
              labelText: "Enter Username",
              myicon: Icons.person,
              obscureText: false,
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
              onPressed: () => AuthController.instance.registerUser(
                _usernameController.text,
                _emailController.text,
                _passwordController.text,
                AuthController.instance.profilePhoto,
              ),
              color: myRed,
              child: const Text("Register"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have account? "),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Login",
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
