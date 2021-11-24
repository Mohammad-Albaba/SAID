

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:requset/modules/login/loginScreen.dart';
import 'package:requset/shared/components/components.dart';
import 'package:requset/shared/network/end_points.dart';
import 'package:requset/shared/network/local/cache_helper.dart';
import 'package:requset/shared/network/remote/dio_helper.dart';

String firebaseToken = '';

String fcmToken = '';

String token = '';

String uId = '';

String phone = '';


void signOut(context) async{
  CacheHelper.clearData().then((value){
    if(value){
      navigateAndFinish(context, LoginScreen(),);
    }
  });

}

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}