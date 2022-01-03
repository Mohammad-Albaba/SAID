import 'package:flutter/material.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:requset/modules/request_details.dart';
import 'package:requset/shared/components/components.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => buildOrder(context),
        separatorBuilder: (context, index) => SizedBox(
          height: 0.0,
        ),
        itemCount: 3,
      ),
    );
  }

  Widget buildOrder(context) => InkWell(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              myDivider(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
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
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 4.0),
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              'Pending',
                              style: TextStyle(
                                fontFamily: 'Jannah',
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          '4 mins',
                          style: TextStyle(
                            fontFamily: 'Jannah',
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: BarProgress(
                  percentage: 50.0,
                  backColor: Colors.black12,
                  gradient:
                      LinearGradient(colors: [Colors.lightGreen, Colors.green]),
                  showPercentage: false,
                  stroke: 8,
                  round: true,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
        onTap: () {
          navigateTo(context, RequestDetails());
        },
      );
}
