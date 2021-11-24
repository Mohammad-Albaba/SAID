import 'package:requset/models/completeLogin_model.dart';
import 'package:requset/models/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {

  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}

class CompleteLoginLoadingState extends LoginStates {}

class CompleteLoginSuccessState extends LoginStates{
  final CompleteLoginModel completeLoginModel;

  CompleteLoginSuccessState(this.completeLoginModel);
}

class CompleteLoginErrorState extends LoginStates
{
  final String error;

  CompleteLoginErrorState(this.error);
}

