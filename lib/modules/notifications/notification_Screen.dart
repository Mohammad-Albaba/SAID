import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:requset/layout/home_layout.dart';
import 'package:requset/modules/profile/profile_Screen.dart';
import 'package:requset/shared/components/components.dart';
import 'package:requset/shared/styles/colors.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onTap: (){
            navigateTo(context, HomeLayout());
          },
        ),
        title: Text(
          'Notification',
          style: Theme.of(context).textTheme.bodyText2.copyWith(
            color: BLACK,
            fontSize: 14.0,
          ),),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.notifications_none_outlined, size: 30.0,),
            onPressed: (){
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
                  backgroundImage:
                  NetworkImage('https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?size=338&ext=jpg'),
                ),
              ),
            ),
            onTap: (){
              navigateTo(context, ProfileScreen());
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => buildNotificationItem(context),
          separatorBuilder: (context, index) => SizedBox(
            height: 0.0,
          ),
          itemCount: 10,
        ),
      ),
    );
  }
  Widget buildNotificationItem(context) => Column(
    children: [
      myDivider(),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/notification.svg',
              height: 43,
              width : 43,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'the order in the way',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: BLACK,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '14 March 2021',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: ColorHintText,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/point.svg',
                height: 10,
                width : 10,
              ),
            ),
          ],
        ),
      ),
    ],
  );


  }
