import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requset/layout/cubit/cubit.dart';
import 'package:requset/layout/cubit/states.dart';
import 'package:requset/modules/login/cubit/cubit.dart';
import 'package:requset/shared/bloc_observer.dart';
import 'package:requset/shared/components/constant.dart';
import 'package:requset/shared/network/local/cache_helper.dart';
import 'package:requset/shared/network/remote/dio_helper.dart';

import 'layout/home_layout.dart';
import 'modules/login/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  // firebaseToken = await FirebaseAuth.instance.currentUser.getIdToken();
  // print('FirebaseToken ' + firebaseToken);
  // CacheHelper.putData(key: 'firebaseToken', value: firebaseToken);`

  fcmToken = await FirebaseMessaging.instance.getToken();
  print('FcmToken ' + fcmToken);
  CacheHelper.putData(key: 'fcmToken', value: fcmToken);

  //method to choose of start widget
  Widget widget;
  token = CacheHelper.getData(key: 'token');
  print(token + 'token main');
  if (token != null) {
    print('home layout');
    widget = HomeLayout();
  } else {
    print('LoginScreen');
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Widget startWidget;

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
          create: (BuildContext context) => AppCubit()
            ..getUserData()
            ..profileModel,
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: startWidget,
            // home: HomeLayout(),
          );
        },
      ),
    );
  }
}
