import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requset/layout/cubit/cubit.dart';
import 'package:requset/layout/cubit/states.dart';
import 'package:requset/layout/home_layout.dart';
import 'package:requset/modules/login/cubit/cubit.dart';
import 'package:requset/modules/login/loginScreen.dart';
import 'package:requset/shared/bloc_observer.dart';
import 'package:requset/shared/components/constant.dart';
import 'package:requset/shared/network/local/cache_helper.dart';
import 'package:requset/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  firebaseToken = await FirebaseAuth.instance.currentUser.getIdToken();
  //print('FirebaseToken ' + firebaseToken);
  CacheHelper.putData(key: 'firebaseToken', value: firebaseToken);

  fcmToken = await FirebaseMessaging.instance.getToken();
  //print('FcmToken ' + fcmToken);
  CacheHelper.putData(key: 'fcmToken', value: fcmToken);

  Widget widget;
  token = CacheHelper.getData(key: 'token');
  //print('Token ' + token);
  if (token != null) {
    widget = HomeLayout();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Widget startWidget;

  MyApp({
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeLayout(),
            //home: startWidget,
          );
        },
      ),
    );
  }
}
