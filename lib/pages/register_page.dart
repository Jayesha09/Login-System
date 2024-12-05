import 'package:flutter/material.dart';
import 'package:supabase_auth/auth/auth_service.dart';
import 'package:supabase_auth/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //get auth services
  final authService = AuthService();

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  //signup button pressed
  void signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confrimPassword = _confirmPasswordController.text;

    if (password != confrimPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Password don't match")));
      return;
    }

    //sign up attempt
    try {
      await authService.signUpWithEmailPassword(email, password);

      //pop register page
      Navigator.pop(context);
    }
    //catch any errors..
    catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error:$e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
          children: [
            //email
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            //password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
            ),

            //password
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: "Confirm Password"),
            ),
            const SizedBox(height: 12),
            //button
            ElevatedButton(
              onPressed: signUp,
              child: const Text("Sign Up"),
            ),

            const SizedBox(height: 12),
            //go to register page
            GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    )),
                child: const Center(child: Text("Already a Member?Login"))),
          ],
        ));
  }
}
