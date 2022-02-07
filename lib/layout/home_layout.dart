import 'package:flutter/material.dart';
import 'package:requset/modules/notifications/notification_Screen.dart';
import 'package:requset/modules/orders/orders_Screen.dart';
import 'package:requset/modules/profile/profile_Screen.dart';
import 'package:requset/modules/request/requests_Screen.dart';
import 'package:requset/shared/components/components.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print('Token ' + token);
  // }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          toolbarHeight: 140,
          elevation: 0,
          title: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'S A I D',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
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
                    child: CircleAvatar(
                      radius: 20.0,
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?size=338&ext=jpg'),
                      ),
                    ),
                    onTap: () {
                      navigateTo(context, ProfileScreen());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 28.0,
              ),
              Container(
                height: 35.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(
                    9.0,
                  ),
                ),
                child: TabBar(
                  indicatorWeight: 0.1,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontSize: 18.0,
                  ),
                  labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  isScrollable: false,
                  indicator: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2.0),
                      borderRadius:
                          BorderRadius.circular(9.0), // Creates border
                      color: Colors.white),
                  tabs: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Tab(
                        child: Text(
                          'Requests',
                          style: TextStyle(
                            fontFamily: 'Jannah',
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Tab(
                        child: Text(
                          'Orders',
                          style: TextStyle(
                            fontFamily: 'Jannah',
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RequestsScreen(),
            OrdersScreen(),
          ],
        ),
      ),
    );
  }
}
