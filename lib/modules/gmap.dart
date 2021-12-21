// import 'dart:collection';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:requset/layout/home_layout.dart';
// import 'package:requset/shared/components/components.dart';
// import 'package:requset/shared/styles/colors.dart';
//
// class GMAP extends StatefulWidget {
//   @override
//   _GMAPState createState() => _GMAPState();
// }
//
// class _GMAPState extends State<GMAP> {
//   Set<Marker> _markers = HashSet<Marker>();
//   Set<Polygon> _polygon = HashSet<Polygon>();
//   Set<Polyline> _polylines = HashSet<Polyline>();
//   Set<Circle> _circles = HashSet<Circle>();
//
//   GoogleMapController _mapController;
//   LatLng _initialcameraposition = LatLng(31.5020602081182, 34.466415307244745);
//   GoogleMapController _controller;
//   Location _location = Location();
//   // BitmapDesn;
//
//   @override
//   void initState() {
//     super.initState();
//     //_setMarkerIcon();
//     //_setPolygon();
//     // _setPolylines();
//     // _setCircles();
//   }
//
//   // void _setMarkerIcon() async {
//   //   _markerIcon = await BitmapDescriptor.fromAssetImage(
//   //       ImageConfiguration(), 'assets/images/welcome.jpg');
//   // }
//
//   // void _setPolygon() async {
//   //   List<LatLng> polygonLatLongs = List<LatLng>();
//   //   polygonLatLongs.add(LatLng(37.78493, -122.42932));
//   //   polygonLatLongs.add(LatLng(37.78683, -122.41942));
//   //   polygonLatLongs.add(LatLng(37.78923, -122.41542));
//   //   polygonLatLongs.add(LatLng(37.78923, -122.42582));
//   //
//   //   _polygon.add(
//   //     Polygon(
//   //       polygonId: PolygonId('0'),
//   //       points: polygonLatLongs,
//   //       fillColor: Colors.white,
//   //       strokeWidth: 1,
//   //     ),
//   //   );
//   // }
//
//   // void _setPolylines() {
//   //   List<LatLng> polylineLatLongs = List<LatLng>();
//   //   polylineLatLongs.add(LatLng(37.78493, -122.42932));
//   //   polylineLatLongs.add(LatLng(37.78683, -122.41942));
//   //   polylineLatLongs.add(LatLng(37.78923, -122.41542));
//   //   polylineLatLongs.add(LatLng(37.78923, -122.42582));
//   //
//   //   _polylines.add(
//   //     Polyline(
//   //       polylineId: PolylineId('0'),
//   //       points: polylineLatLongs,
//   //       color: Colors.purple,
//   //       width: 1,
//   //     ),
//   //   );
//   // }
//
//   // void _setCircles() {
//   //   _circles.add(Circle(
//   //     circleId: CircleId('0'),
//   //     center: LatLng(37.76493, -122.42432),
//   //     radius: 1000,
//   //     strokeWidth: 2,
//   //     fillColor: Color.fromRGBO(102, 51, 153, 5),
//   //   ));
//   // }
//
//   Future<void> _onMapCreated(GoogleMapController _cntlr) async {
//     _controller = _cntlr;
//     _location.onLocationChanged.listen((l) {
//       _controller.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//               target: LatLng(
//                 l.latitude,
//                 l.longitude,
//               ),
//               zoom: 17),
//         ),
//       );
//     });
//   }
//
//   _onCameraMove(CameraPosition position) {
//     _location = position.target as Location;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'dropoff location',
//           style: Theme.of(context).textTheme.bodyText2.copyWith(
//                 color: BLACK,
//                 fontSize: 16.0,
//               ),
//         ),
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         shadowColor: Colors.white,
//         elevation: 0.0,
//         centerTitle: true,
//         leading: InkWell(
//           child: Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Colors.black,
//             size: 20.0,
//           ),
//           onTap: () {
//             navigateTo(context, HomeLayout());
//           },
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           children: [
//             GoogleMap(
//               initialCameraPosition:
//                   CameraPosition(target: _initialcameraposition),
//               mapType: MapType.normal,
//               onMapCreated: _onMapCreated,
//               myLocationEnabled: true,
//               myLocationButtonEnabled: true,
//               onCameraMove: _onCameraMove,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:requset/modules/requests_Screen.dart';
import 'package:requset/shared/components/constant.dart';
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
  List<Placemark> placemark;
  Position position;
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('location: ${position.latitude}');
    print('location: ${position.longitude}');
    placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      placemarkName = "${placemark[0].name}";
      print('${placemark} + moh');
      print('$_lastMapPosition + Moh');
      // address =
      //     '${placemark.first.name.isNotEmpty ? placemark.first.name + ', ' : ''}${placemark.first.thoroughfare.isNotEmpty ? placemark.first.thoroughfare + ', ' : ''}${placemark.first.subLocality.isNotEmpty ? placemark.first.subLocality + ', ' : ''}${placemark.first.locality.isNotEmpty ? placemark.first.locality + ', ' : ''}${placemark.first.subAdministrativeArea.isNotEmpty ? placemark.first.subAdministrativeArea + ', ' : ''}${placemark.first.postalCode.isNotEmpty ? placemark.first.postalCode + ', ' : ''}${placemark.first.administrativeArea.isNotEmpty ? placemark.first.administrativeArea : ''}';
    });
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1.complete(controller);
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
    _lastMapPosition = position.target;
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
              title: "${placemark[0].name}",
              snippet: "${placemark[0].street}",
              onTap: () {}),
          onTap: () {},
          icon: BitmapDescriptor.defaultMarker));
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
            Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (context) => RequestsScreen(
                          latitude: position.latitude,
                          longitude: position.latitude,
                        )));
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
                  markers: _markers.toSet(),
                  mapType: _currentMapType,
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 14.4746,
                  ),
                  onMapCreated: _onMapCreated,
                  zoomGesturesEnabled: true,
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
                )
              ]),
            ),
    );
  }
}
