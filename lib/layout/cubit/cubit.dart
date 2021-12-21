import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requset/layout/cubit/states.dart';
import 'package:requset/models/profile_model.dart';
import 'package:requset/models/request_model.dart';
import 'package:requset/shared/components/constant.dart';
import 'package:requset/shared/network/end_points.dart';
import 'package:requset/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  ProfileModel profileModel;

  void getUserData() {
    emit(LoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      printFullText(profileModel.data.name);
      emit(SuccessUserDataState(profileModel));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUserDataState());
    });
  }

  void logOut() {
    DioHelper.postData(url: LOGOUT, token: token, data: {
      // 'message' : message
    })
        .then((value) async => {
              await FirebaseAuth.instance.signOut(),
              print(value.statusMessage),
            })
        .catchError((error) {
      error.toString();
    });
  }

  RequestModel requestModel;
  void postRequest({
    @required String deliveryNotes,
    @required DropLocation dropLocation,
  }) {
    emit(LoadingRequestState());
    DioHelper.postData(url: REQUEST, token: token, data: {
      'deliveryNotes': deliveryNotes,
      'dropLocation': {
        'name': dropLocation.name,
        'coordinates': dropLocation.coordinates,
      }
    })
        .then((value) => {
              print('RequestData' + value.data.toString()),
              requestModel = RequestModel.fromJson(value.data),
              emit(SuccessRequestState(requestModel)),
            })
        .catchError((error) {
      emit(ErrorRequestState(error.toString()));
    });
  }
}
