import 'package:audio_wave/audio_wave.dart';
import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:requset/modules/gmap.dart';
import 'package:requset/shared/components/components.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestsScreen extends StatefulWidget {

  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {

  @override
  Widget build(BuildContext context) {
    return AvoidKeyboard(
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
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              children: [
                                Icon(Icons.play_arrow,size: 30,color: Colors.green,),
                                SizedBox(width: 16.0,),
                                AudioWave(
                                  height: 23,
                                  width: 282,
                                  spacing: 2.5,
                                  animationLoop: 5,
                                  bars: [
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                    AudioWaveBar(height: 10, color: Colors.green),
                                    AudioWaveBar(height: 30, color: Colors.green),
                                    AudioWaveBar(height: 70, color: Colors.green),
                                    AudioWaveBar(height: 40),
                                    AudioWaveBar(height: 20, color: Colors.green),
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                  child: SvgPicture.asset(
                                    'assets/icons/audio.svg',
                                    height: 22,
                                    width : 15,
                                  ),
                                  onTap: (){},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      myDivider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 8.0,top: 16.0),
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
                              controller: TextEditingController(),
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
                                onTap: (){
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
            Positioned.fill(child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: 56.0,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: (){},
                  child: Center(
                      child: Text('Order Now!', style: TextStyle(
                        fontFamily: 'Jannah',
                      ),)),
                ),
              ),
            ),),
          ],

        ),
      ),
    );
  }
}
