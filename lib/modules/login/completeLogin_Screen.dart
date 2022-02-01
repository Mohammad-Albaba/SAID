import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requset/layout/home_layout.dart';
import 'package:requset/modules/login/cubit/cubit.dart';
import 'package:requset/modules/login/cubit/states.dart';
import 'package:requset/shared/components/components.dart';
import 'package:requset/shared/network/local/cache_helper.dart';
import 'package:requset/shared/styles/colors.dart';
import 'package:requset/shared/styles/icon_broken.dart';

class CompleteLoginScreen extends StatefulWidget {
  @override
  State<CompleteLoginScreen> createState() => _CompleteLoginScreenState();
}

class _CompleteLoginScreenState extends State<CompleteLoginScreen> {
  var nameController = TextEditingController();
  var phone = CacheHelper.getData(key: 'phone');

  // UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          //  phoneController = TextEditingController(text: widget.phone);
          //  print('phone' + state.loginModel.data.user.phone);
        }
      },
      builder: (context, state) {
        return AvoidKeyboard(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              elevation: 0.0,
              title: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'S A I D',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Jannah',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'complete profile',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: BLACK,
                            fontSize: 14.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              height: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  myDivider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 64.0,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 60.0,
                                  // backgroundImage:  profileImage == null ?
                                  // NetworkImage('${userModel.image}',)
                                  //     : FileImage(profileImage),
                                ),
                              ),
                              IconButton(
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ),
                                onPressed: () {
                                  // AppCubit.get(context).getProfileImage();
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          //     if(AppCubit.get(context).profileImage != null)

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: BLACK,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            color: bgColor,
                            child: defaultFormField(
                              controller: nameController,
                              type: TextInputType.name,
                              hint: 'Enter your name',
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'name must not be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Phone number',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: BLACK,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            color: bgColor,
                            child: defaultFormField(
                              controller: TextEditingController(text: phone),
                              type: TextInputType.phone,
                              hint: 'Enter your phone',
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'name must not be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          SizedBox(
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        height: 56.0,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            if (state is! CompleteLoginLoadingState) {
                              LoginCubit.get(context).userCompleteLogin(
                                name: nameController.text,
                              );
                              if (state is CompleteLoginSuccessState) {
                                navigateAndFinish(context, HomeLayout());
                              }
                            }
                            //   print('nameController' + nameController.text);
                          },
                          child: Center(
                              child: Text(
                            'Save',
                            style: TextStyle(
                              fontFamily: 'Jannah',
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
