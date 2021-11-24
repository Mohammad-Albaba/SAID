import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requset/layout/cubit/states.dart';
import 'package:requset/models/profile_model.dart';
import 'package:requset/shared/components/constant.dart';
import 'package:requset/shared/network/end_points.dart';
import 'package:requset/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  ProfileModel profileModel;

  void getUserData(){
    emit(LoadingUserDataState());

    DioHelper.getData(
        url: PROFILE,
        token: token,
    ).then((value){
        profileModel = ProfileModel.fromJson(value.data);
        printFullText(profileModel.data.name);
        emit(SuccessUserDataState(profileModel));
    }).catchError((error){
        print(error.toString());
        emit(ErrorUserDataState());
    });
  }

  void logOut(){
    DioHelper.postData(
        url: LOGOUT,
        token: token,
        data: {
          // 'message' : message
        }
    ).then((value)async => {
      await FirebaseAuth.instance.signOut(),
      print(value.statusMessage),
    }).catchError((error){
      error.toString();
    });
  }
}
