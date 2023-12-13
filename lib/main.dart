//main.dart
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shopping3/screen/home_screen.dart';



void main() {
  KakaoSdk.init(nativeAppKey: 'a06969174f59360b44a54998a6bab1a2' );//sdk ver21설정, usernative key 넣기//관리자 에러 뜨면 영상 19:55 보고 풀기
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '살래말래',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}