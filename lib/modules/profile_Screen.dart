import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requset/layout/cubit/cubit.dart';
import 'package:requset/layout/cubit/states.dart';
import 'package:requset/layout/home_layout.dart';
import 'package:requset/modules/login/loginScreen.dart';
import 'package:requset/modules/notification_Screen.dart';
import 'package:requset/shared/components/components.dart';
import 'package:requset/shared/components/constant.dart';
import 'package:requset/shared/network/local/cache_helper.dart';
import 'package:requset/shared/styles/colors.dart';
import 'package:requset/shared/styles/icon_broken.dart';

class ProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SuccessUserDataState) {}
      },
      builder: (context, state) {
        try {
          var model = AppCubit.get(context).profileModel;
          nameController.text = model.data.name;
          phoneController.text = phone;
        } catch (error) {
          error.toString();
        }

        return ConditionalBuilder(
          condition: AppCubit.get(context).profileModel != null,
          builder: (context) => AvoidKeyboard(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                shadowColor: Colors.white,
                elevation: 0.0,
                leading: InkWell(
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  onTap: () {
                    navigateTo(context, HomeLayout());
                  },
                ),
                title: Text(
                  'Profile',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: BLACK,
                        fontSize: 14.0,
                      ),
                ),
                actions: [
                  IconButton(
                    color: Colors.black,
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      size: 30.0,
                    ),
                    onPressed: () {
                      navigateTo(context, NotificationScreen());
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: CircleAvatar(
                        radius: 20.0,
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?size=338&ext=jpg'),
                        ),
                      ),
                    ),
                    onTap: () {
                      navigateTo(context, ProfileScreen());
                    },
                  ),
                ],
              ),
              body: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        myDivider(),
                        SizedBox(
                          height: 38.0,
                        ),
                        CircleAvatar(
                          radius: 64.0,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage: NetworkImage(
                                'https://image.freepik.com/free-photo/smart-handsome-businessman-giving-recommendations_1262-5595.jpg'),
                            // backgroundImage:  profileImage == null ?
                            // NetworkImage('${userModel.image}',)
                            //     : FileImage(profileImage),
                          ),
                        ),
                        SizedBox(
                          height: 22.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                  hint: 'Mohammad Albaba',
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                  controller: phoneController,
                                  type: TextInputType.phone,
                                  hint: '+972 59-533-5637',
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'name must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: InkWell(
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Icon(IconBroken.Logout,
                                    size: 24.0, color: Colors.blue),
                              ),
                              Text(
                                'Logout',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Jannah',
                                    fontSize: 14.0,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          AppCubit.get(context).logOut();
                          CacheHelper.clearData().then((value) {
                            if (value) {
                              navigateAndFinish(
                                context,
                                LoginScreen(),
                              );
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  void callDataProfile() async {}
}
