import 'package:flutter/material.dart';
import '../components/my_textfeild.dart';
class LoginPage extends StatelessWidget{
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _pwController = TextEditingController();
   LoginPage({super.key,});

  @override
  Widget build(BuildContext context)
  { return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
    body: Column(
      children: [
        //logo
        Icon(Icons.message,
          size : 60,
          color:Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 50),

        //Welcome back message
        Text(
          "Welcome back,you've been missed",
          style : TextStyle(
            color:Theme.of(context).colorScheme.primary,
            fontSize: 16,
          )
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
          hintText: "Email",
          obscureText: true,
          controller: _emailController,
    ),

      ],
    ),
  );



  }
}
