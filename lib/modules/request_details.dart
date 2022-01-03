import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:requset/shared/components/components.dart';

class RequestDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white.withOpacity(0.1),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: 22.0,
          ),
        ),
        title: Text(
          '#123456',
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontFamily: 'Jannah',
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 25.0,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Pending',
                  style: TextStyle(
                      fontFamily: 'Jannah',
                      fontSize: 12.0,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                myDivider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?size=338&ext=jpg'),
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ali Mohamoud',
                            style: TextStyle(
                              fontFamily: 'Jannah',
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                                size: 12.0,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                '4.5 (450)',
                                style: TextStyle(
                                  fontFamily: 'Jannah',
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.call,
                        color: Colors.blue,
                        size: 25.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
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
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Bring me a pizza form al tabon 2 salami medium size and coke 2  liter',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 32.0,
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
                    ],
                  ),
                ],
              ),
            ),
            myDivider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dropoff',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Al senaah rayes st, louzon buildings 50/51',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
