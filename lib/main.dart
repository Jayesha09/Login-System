import 'package:flutter/material.dart';
import 'package:supabase_auth/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //supabase setup
  await Supabase.initialize(
      url: "https://ljfzbjjbrlwnrmgitbqp.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxqZnpiampicmx3bnJtZ2l0YnFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMzNDIxNTYsImV4cCI6MjA0ODkxODE1Nn0.PcnJ7slS1JC--5Y4W7Xnl7vozD4SFc-xJLeKz7_tTKw");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthGate(),
    );
  }
}
