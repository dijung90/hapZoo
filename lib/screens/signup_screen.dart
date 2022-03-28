import 'package:flutter/material.dart';
import 'package:hapzoo/commons/emailsender.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as EmailSender;
    return Scaffold(
      body: Center(child: Text(args.email)),
    );
  }
}
