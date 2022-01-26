import 'dart:io';

import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:path/path.dart';
import 'package:requset/layout/cubit/cubit.dart';
import 'package:requset/layout/cubit/states.dart';
import 'package:requset/models/request_model.dart';
import 'package:requset/modules/gmap.dart';
import 'package:requset/modules/orders_Screen.dart';
import 'package:requset/modules/recored/audio_player.dart';
import 'package:requset/modules/recored/audio_recorder.dart';
import 'package:requset/shared/components/components.dart';
import 'package:requset/shared/components/constant.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  var needsController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool showPlayer = false;
  ap.AudioSource audioSource;
  File record;
  FlutterUploader uploader = FlutterUploader();
  Map<String, File> _tasks = {};
  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  Future<File> _uploadFile(filepath) async {
    if (record != null) {
      final String filename = basename(record.path);
      final String savedDir = dirname(record.path);
      final tag = "record upload ${_tasks.length + 1}";
      var fileItem = FileItem(
        filename: filename,
        savedDir: savedDir,
        fieldname: "file",
      );
      await uploader.enqueue(
        url: filepath, //required: url to upload to
        files: [fileItem], // required: list of files that you want to upload
        method: UploadMethod.POST,
        showNotification:
            false, // send local notification (android only) for upload status
        tag: tag,
      );
    }
  }

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
                              padding: const EdgeInsets.only(
                                top: 16.0,
                                left: 16.0,
                                bottom: 16.0,
                              ),
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
                                    height: 25.0,
                                  ),
                                  Container(
                                    height: 60,
                                    width: double.infinity,
                                    child: showPlayer
                                        ? AudioPlayer(
                                            source: audioSource,
                                            onDelete: () {
                                              setState(
                                                  () => showPlayer = false);
                                            },
                                          )
                                        : AudioRecorder(
                                            onStop: (path) {
                                              setState(() {
                                                audioSource =
                                                    ap.AudioSource.uri(
                                                  Uri.parse(path),
                                                );
                                                showPlayer = true;
                                                record = File(path);
                                              });
                                              print('$path + ui');
                                              print('$record + nnnn');
                                            },
                                          ),
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.play_arrow,
                                  //       size: 30,
                                  //       color: Colors.green,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 16.0,
                                  //     ),
                                  //     AudioWave(
                                  //       height: 25,
                                  //       width: 260,
                                  //       spacing: 2.9,
                                  //       animationLoop: 5,
                                  //       bars: [
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 10, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 30, color: Colors.green),
                                  //         AudioWaveBar(
                                  //             height: 70, color: Colors.green),
                                  //         AudioWaveBar(height: 40),
                                  //         AudioWaveBar(
                                  //             height: 20, color: Colors.green),
                                  //       ],
                                  //     ),
                                  //     Spacer(),
                                  //     InkWell(
                                  //       child: SvgPicture.asset(
                                  //         'assets/icons/audio.svg',
                                  //         height: 22,
                                  //         width: 15,
                                  //       ),
                                  //       onTap: () {},
                                  //     ),
                                  //   ],
                                  // ),
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
                                  recordVoice: _uploadFile(record),
                                  dropLocation: DropLocation(
                                    name: placemarkName.toString(),
                                    coordinates: Coordinates(
                                      lat: latitude,
                                      lng: longitude,
                                    ),
                                  ),
                                );
                                if (state is SuccessRequestState) {
                                  return showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
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
                                              Container(
                                                width: 87.0,
                                                height: 87.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                ),
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/ok.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
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
