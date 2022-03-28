import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hapzoo/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    Timer(
       const Duration(milliseconds: 2000), () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => LoginScreen(),
            )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Expanded(child: SizedBox(), flex: 2,),
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Expanded(child: SizedBox(),flex: 2,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text('합Zoo', style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0,),
                      child: Divider(thickness: 1.0, color: Colors.grey,),
                    ),
                    Text('음악으로 하나되는 세상', style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                    ),),
                  ],
                ),flex: 1,),
                const Expanded(child: SizedBox(),flex: 1,),
                const Expanded(child: Center(
                  child: Text('여차여차Co.'),
                ),flex: 1,),
              ],
            ),
            flex: 3,
          ),
          const Expanded(child: SizedBox(), flex: 2,),
        ],
      ),
    );
  }
}

