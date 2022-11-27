import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.08),
            const Text(
              "Let's sign you in.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Welcome back.\nYou've been missed!",
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Don't have an account? "),
                Text('Register'),
              ],
            ),
            SizedBox(
              width: size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
