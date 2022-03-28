import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hapzoo/commons/google_sign_in_Api.dart';
import 'package:hapzoo/screens/signup_screen.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

import '../commons/emailsender.dart';

class LoginScreen extends StatelessWidget {
  String? email;

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          const Expanded(child: SizedBox(),flex: 1,),
          Expanded(child: Column(
            children: <Widget>[
              Expanded(child: Row(
                children: [
                  const Expanded(child: SizedBox(),flex: 1,),
                  Expanded(
                    child: Column(
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
                        Text('여차여차Co.', style: TextStyle(
                          fontSize: 15.0,
                        ),),

                      ],
                    ),flex: 2,
                  ),
                  const Expanded(child: SizedBox(),flex: 1,),
                ],
              ),flex: 2,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      if(await isKakaoTalkInstalled()){ //카톡 설치여부 확인
                        try{//카카오톡 로그인
                          await UserApi.instance.loginWithKakaoTalk();
                          User user = await UserApi.instance.me();
                          email = user.kakaoAccount?.email;
                          Navigator.pushNamed(context, 'signup', arguments: EmailSender(email: email as String));
                        }catch(error){//실패
                          if(error is PlatformException && error.code == 'CANCELED'){
                            return;//뒤로 가기
                          }
                          try{//뒤로 간 후 계정으로 로그인
                            await UserApi.instance.loginWithKakaoAccount();
                            User user = await UserApi.instance.me();
                            email = user.kakaoAccount?.email;
                            Navigator.pushNamed(context, 'signup', arguments: EmailSender(email: email as String));
                          }catch(error){}
                        }
                      }else{
                        try{//계정으로 로그인
                          await UserApi.instance.loginWithKakaoAccount();
                          User user = await UserApi.instance.me();
                          email = user.kakaoAccount?.email;
                          Navigator.pushNamed(context, 'signup', arguments: EmailSender(email: email as String));
                        }catch(error){}
                      }
                    },
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/sns_icon/kakao.png',),
                          const Expanded(child: Text('카카오로 로그인', textAlign: TextAlign.center,),),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  GestureDetector (
                    onTap:() async{
                        try{
                          NaverLoginResult res = await FlutterNaverLogin.logIn();
                          email = res.account.email;
                          Navigator.pushNamed(context, 'signup', arguments: EmailSender(email: email as String));
                        }catch(error){
                          if(error is PlatformException && error.code == 'CANCELED'){
                            return;
                          }//뒤로 가기
                        }
                    },
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/sns_icon/naver.png', width: 34.0,),
                          const Expanded(child: Text('네이버로 로그인', textAlign: TextAlign.center,),),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      try{
                        final user = await GoogleSignInAPI.login();
                        if(user == null){
                          return;
                        }else{
                          email = user.email;
                          Navigator.pushNamed(context, 'signup', arguments: EmailSender(email: email as String));
                        }
                      }catch(error){
                        print(error);
                      }

                    },
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/sns_icon/google.png', width: 34.0,),
                          const Expanded(child: Text('구글로 로그인', textAlign: TextAlign.center,),),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ],
              ),flex: 1,),
              const Expanded(child: SizedBox(),flex: 2,),
            ],
          ),flex: 6,),
          const Expanded(child: SizedBox(),flex: 1,),
        ],
      ),

    );
  }

}
