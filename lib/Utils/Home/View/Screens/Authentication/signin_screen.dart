import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome Back", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              Gap(8),
              Text("Sign In with your email and password or continue with social media.",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              )
            ],
          ),
        ),
      ),

    );
  }
}
