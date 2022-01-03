import 'package:audio_wave/audio_wave.dart';
import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:requset/layout/cubit/cubit.dart';
import 'package:requset/layout/cubit/states.dart';
import 'package:requset/models/request_model.dart';
import 'package:requset/modules/gmap.dart';
import 'package:requset/modules/orders_Screen.dart';
import 'package:requset/shared/components/components.dart';
import 'package:requset/shared/components/constant.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  var needsController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: formKey,
          child: AvoidKeyboard(
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Container(
                        height: 500.0,
                        child: Column(
                          children: [
                            myDivider(),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Needs',
                                    style: TextStyle(
                                      fontFamily: 'Jannah',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  TextFormField(
                                    controller: needsController,
                                    maxLines: 2,
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "Leave your needs here..",
                                      hintStyle: TextStyle(
                                        fontFamily: 'Jannah',
                                        color: Colors.grey,
                                      ),
                                    ),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'needs must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        size: 30,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 16.0,
                                      ),
                                      AudioWave(
                                        height: 25,
                                        width: 260,
                                        spacing: 2.9,
                                        animationLoop: 5,
                                        bars: [
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                          AudioWaveBar(
                                              height: 10, color: Colors.green),
                                          AudioWaveBar(
                                              height: 30, color: Colors.green),
                                          AudioWaveBar(
                                              height: 70, color: Colors.green),
                                          AudioWaveBar(height: 40),
                                          AudioWaveBar(
                                              height: 20, color: Colors.green),
                                        ],
                                      ),
                                      Spacer(),
                                      InkWell(
                                        child: SvgPicture.asset(
                                          'assets/icons/audio.svg',
                                          height: 22,
                                          width: 15,
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            myDivider(),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 8.0,
                                top: 16.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dropoff',
                                    style: TextStyle(
                                      fontFamily: 'Jannah',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  TextFormField(
                                    controller: TextEditingController(
                                      text: placemarkName.toString(),
                                    ),
                                    maxLines: 2,
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "Your address",
                                      hintStyle: TextStyle(
                                        fontFamily: 'Jannah',
                                        color: Colors.grey,
                                      ),
                                    ),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Your address must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.blue,
                                        size: 30.0,
                                      ),
                                      onTap: () {
                                        navigateTo(context, GMAP());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              if (state is! LoadingRequestState) {
                                await AppCubit.get(context).postRequest(
                                  deliveryNotes: needsController.text,
                                  dropLocation: DropLocation(
                                    name: placemarkName.toString(),
                                    coordinates: Coordinates(
                                      lat: latitude,
                                      lng: longitude,
                                    ),
                                  ),
                                );
                                if (state is SuccessRequestState) {
                                  AlertDialog(
                                    title: Stack(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 15.0,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/audio.svg',
                                              height: 87,
                                              width: 87,
                                            ),
                                            SizedBox(
                                              height: 24.0,
                                            ),
                                            Text(
                                              'your order placed successfully',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                            SizedBox(
                                              height: 3.0,
                                            ),
                                            Text(
                                              'Said is working for you',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                navigateTo(
                                                    context, OrdersScreen());
                                              },
                                              child: Center(
                                                  child: Text(
                                                'View order',
                                                style: TextStyle(
                                                  fontFamily: 'Jannah',
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                ),
                                              )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }
                              }
                            }
                          },
                          child: Center(
                              child: Text(
                            'Order Now!',
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
