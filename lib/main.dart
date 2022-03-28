import 'package:flutter/material.dart';
import 'package:hapzoo/screens/signup_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';


void main() {
  KakaoSdk.init(nativeAppKey: '3700d2908e7ffa5ea61401309740c564');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          theme: ThemeData.light(),
          home: const WelcomeScreen(),
          routes: {
            'login' : (context) => LoginScreen(),
            'signup' : (context) => SignupScreen(),
          },
      );
  }

}

