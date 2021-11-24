
import 'package:requset/models/profile_model.dart';

abstract class AppStates{}

class AppInitialState extends AppStates{}

class LoadingUserDataState extends AppStates{}

class SuccessUserDataState extends AppStates
{
  final ProfileModel profileModel;

  SuccessUserDataState(this.profileModel);
}

class ErrorUserDataState extends AppStates{}