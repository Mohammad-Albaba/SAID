import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:requset/layout/cubit/cubit.dart';
import 'package:requset/layout/cubit/states.dart';
import 'package:requset/modules/request/requests_Screen.dart';
import 'package:requset/shared/styles/colors.dart';

class GMAP extends StatefulWidget {
  @override
  _GMAPState createState() => _GMAPState();
}

class _GMAPState extends State<GMAP> {
  Completer<GoogleMapController> controller1;

  static LatLng _initialPosition;

  final Set<Marker> _markers = {};
  static LatLng _lastMapPosition = _initialPosition;
  List<Placemark> place;
  Position position;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<Position> _getUserLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> newPlace =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      place = newPlace;
      _initialPosition = LatLng(position.latitude, position.longitude);
      AppCubit.get(context).placemarkName = "${place.last.name}";
      print('${place.last.name} + moh');
      print('$_lastMapPosition + Moh');
    });
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1.complete(controller);
    });
    _getUserLocation().then((value) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              value.latitude,
              value.longitude,
            ),
            zoom: 16.0,
          ),
        ),
      );
    });
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onCameraMove(CameraPosition position) {
    setState(() {
      _lastMapPosition = position.target;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId(_lastMapPosition.toString()),
            position: _lastMapPosition,
            infoWindow: InfoWindow(
                title: "${place.last.name}",
                snippet: "${place.last.street}",
                onTap: () {
                  setState(() {
                    AppCubit.get(context).placemarkName = "${place.last.name}";
                  });
                }),
            onTap: () {},
            icon: BitmapDescriptor.defaultMarker),
      );
    });
  }

  Widget mapButton(Function function, Icon icon, Color color) {
    return RawMaterialButton(
      onPressed: function,
      child: icon,
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(7.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'dropoff location',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: BLACK,
                    fontSize: 16.0,
                  ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            shadowColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            leading: InkWell(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
                size: 20.0,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: _initialPosition == null
              ? Container(
                  child: Center(
                    child: Text(
                      'loading map..',
                      style: TextStyle(
                          fontFamily: 'Avenir-Medium', color: Colors.grey[400]),
                    ),
                  ),
                )
              : Container(
                  child: Stack(children: <Widget>[
                    GoogleMap(
                      onTap: (LatLng latLng) async {
                        List<Placemark> newPlace =
                            await placemarkFromCoordinates(
                                latLng.latitude, latLng.longitude);
                        setState(() {
                          cubit.latitude = latLng.latitude;
                          cubit.longitude = latLng.longitude;
                          print('location: ${latLng.latitude}');
                          print('location: ${latLng.longitude}');
                          place = newPlace;
                          _initialPosition =
                              LatLng(latLng.latitude, latLng.longitude);
                          cubit.placemarkName = "${place.last.name}";
                          print('${place.last.name} + moh');
                          print('$_lastMapPosition + Moh');
                        });
                        _markers.add(
                          Marker(
                            markerId: MarkerId(_lastMapPosition.toString()),
                            position: latLng,
                            infoWindow: InfoWindow(
                                title: "${place.last.name}",
                                snippet: "${place.last.street}",
                                onTap: () {
                                  setState(() {
                                    cubit.placemarkName = "${place.last.name}";
                                  });
                                }),
                          ),
                        );
                      },
                      markers: Set<Marker>.of(_markers),
                      mapType: _currentMapType,
                      initialCameraPosition: CameraPosition(
                        target: _initialPosition,
                        zoom: 14.4746,
                      ),
                      onMapCreated: _onMapCreated,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: false,
                      onCameraMove: _onCameraMove,
                      myLocationEnabled: true,
                      compassEnabled: true,
                      myLocationButtonEnabled: false,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                          child: Column(
                            children: <Widget>[
                              mapButton(_onAddMarkerButtonPressed,
                                  Icon(Icons.add_location), Colors.blue),
                              mapButton(
                                  _onMapTypeButtonPressed,
                                  Icon(
                                    IconData(0xf473,
                                        fontFamily: CupertinoIcons.iconFont,
                                        fontPackage:
                                            CupertinoIcons.iconFontPackage),
                                  ),
                                  Colors.green),
                            ],
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 52,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RequestsScreen(),
                                ));
                          },
                          child: Text(
                            'Order Now!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
        );
      },
    );
  }
}
