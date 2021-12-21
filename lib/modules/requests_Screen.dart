import 'package:audio_wave/audio_wave.dart';
import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:requset/layout/cubit/cubit.dart';
import 'package:requset/layout/cubit/states.dart';
import 'package:requset/models/request_model.dart';
import 'package:requset/modules/gmap.dart';
import 'package:requset/shared/components/components.dart';
import 'package:requset/shared/components/constant.dart';

class RequestsScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  RequestsScreen({
    this.latitude,
    this.longitude,
  });
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
                                  left: 16.0, right: 8.0, top: 16.0),
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
                                        text: placemarkName),
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
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              if (state is! LoadingRequestState) {
                                AppCubit.get(context).postRequest(
                                  deliveryNotes: needsController.text,
                                  dropLocation: DropLocation(
                                    name: placemarkName.toString(),
                                    coordinates: Coordinates(
                                      lat: widget.latitude,
                                      lng: widget.longitude,
                                    ),
                                  ),
                                );
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
