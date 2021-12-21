import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requset/models/completeLogin_model.dart';
import 'package:requset/models/login_model.dart';
import 'package:requset/modules/login/cubit/states.dart';
import 'package:requset/shared/components/constant.dart';
import 'package:requset/shared/network/end_points.dart';
import 'package:requset/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel;

  void userLogin({
    @required String firebaseToken,
    @required String fcmToken,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, token: token, data: {
      'firebase_token': firebaseToken,
      'fcm_token': fcmToken,
    }).then((value) {
      print('apiData' + value.data.toString());
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  CompleteLoginModel completeLoginModel;
  void userCompleteLogin({
    @required String name,
  }) {
    emit(CompleteLoginLoadingState());
    DioHelper.postData(url: COMPLETE_LOGIN, token: token, data: {
      'name': name,
    }).then((value) {
      print('CompleteLoginData' + value.data.toString());
      completeLoginModel = CompleteLoginModel.fromJson(value.data);
      emit(CompleteLoginSuccessState(completeLoginModel));
    }).catchError((error) {
      emit(CompleteLoginErrorState(error.toString()));
    });
  }
}
