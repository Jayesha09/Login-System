import 'package:flutter/material.dart';
import 'package:supabase_auth/auth/auth_service.dart';
import 'package:supabase_auth/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //get auth services
  final authService = AuthService();

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //login button pressed
  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    //attempt login
    try {
      await authService.signIhWithEmailPassword(email, password);
    }
    // catch errors
    catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error:$e")));
      }
    }
  }

  //build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        const SizedBox(height: 12),
        //button
        ElevatedButton(
          onPressed: login,
          child: const Text("Login"),
        ),

        const SizedBox(height: 12),
        //go to register page
        GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                )),
            child: const Center(child: Text("Dont have an account? Sign up"))),
      ],
    ));
  }
}
