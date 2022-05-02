import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
      ),
      body: Column(
        children: [
          const Text("We have sent you an Email verification check you mail"),
          const Text(
              "If you havent received the verfication please press the botton below"),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child: const Text("Send Email Verification"),
          ),

           TextButton(
            onPressed: () async {
             await FirebaseAuth.instance.signOut();
             Navigator.of(context).pushNamedAndRemoveUntil(registerRoutes, (route) => false)
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }
}
