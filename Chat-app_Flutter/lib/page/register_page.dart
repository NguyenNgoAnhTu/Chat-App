import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfeild.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _cfController = TextEditingController();

  final void Function()? onTap;

  Register({super.key, required this.onTap});

  //register
  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();
    if (_pwController.text == _cfController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    }
    // pw don't match
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("Password don't match!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const SizedBox(height: 200),

          //logo
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 50),

          //Welcome back message
          Text(
            "Let's create an account for you",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),
          // Email textFeild
          const SizedBox(height: 25),
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(height: 10),
          // pw Email
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _pwController,
          ),
          const SizedBox(height: 10),
          //confirm password
          MyTextField(
            hintText: "Confirm Password",
            obscureText: true,
            controller: _cfController,
          ),
          const SizedBox(height: 25),
          //login
          MyButton(text: "Register", Ontap: () => register(context)),
          const SizedBox(height: 25),

          //Register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
