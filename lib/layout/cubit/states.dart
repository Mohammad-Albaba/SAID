import 'package:requset/models/profile_model.dart';
import 'package:requset/models/request_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class LoadingUserDataState extends AppStates {}

class SuccessUserDataState extends AppStates {
  final ProfileModel profileModel;

  SuccessUserDataState(this.profileModel);
}

class ErrorUserDataState extends AppStates {}

class LoadingRequestState extends AppStates {}

class SuccessRequestState extends AppStates {
  final RequestModel requestModel;

  SuccessRequestState(this.requestModel);
}

class ErrorRequestState extends AppStates {
  final String error;
  ErrorRequestState(this.error);
}

class LoadingGetOrdersState extends AppStates {}

class SuccessGetOrdersState extends AppStates {}

class ErrorGetOrdersState extends AppStates {
  final String error;
  ErrorGetOrdersState(this.error);
}
