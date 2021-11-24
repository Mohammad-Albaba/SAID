import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:requset/layout/home_layout.dart';
import 'package:requset/shared/components/components.dart';
import 'package:requset/shared/styles/colors.dart';

class GMAP extends StatefulWidget {

  @override
  _GMAPState createState() => _GMAPState();
}

class _GMAPState extends State<GMAP> {
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygon = HashSet<Polygon>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  Set<Circle> _circles = HashSet<Circle>();

  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
    _setPolygon();
    _setPolylines();
    _setCircles();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/images/welcome.jpg');
  }

  void _setPolygon() async {
    List<LatLng> polygonLatLongs =  List<LatLng>();
    polygonLatLongs.add( LatLng(37.78493, -122.42932));
    polygonLatLongs.add( LatLng(37.78683, -122.41942));
    polygonLatLongs.add( LatLng(37.78923, -122.41542));
    polygonLatLongs.add( LatLng(37.78923, -122.42582));
    
    _polygon.add(
        Polygon(
            polygonId: PolygonId('0'),
            points: polygonLatLongs,
            fillColor: Colors.white,
            strokeWidth: 1,

        ),
    );
  }

  void _setPolylines()
  {
    List<LatLng> polylineLatLongs =  List<LatLng>();
    polylineLatLongs.add( LatLng(37.78493, -122.42932));
    polylineLatLongs.add( LatLng(37.78683, -122.41942));
    polylineLatLongs.add( LatLng(37.78923, -122.41542));
    polylineLatLongs.add( LatLng(37.78923, -122.42582));

    _polylines.add(
      Polyline(
        polylineId: PolylineId('0'),
        points: polylineLatLongs,
        color: Colors.purple,
        width: 1,

      ),
    );
  }

  void _setCircles()
  {
    _circles.add(
        Circle(
            circleId: CircleId('0'),
            center: LatLng(37.76493, -122.42432),
            radius: 1000,
            strokeWidth: 2,
            fillColor: Color.fromRGBO(102, 51, 153, 5),
        ));

  }

    void _onMapCreated(GoogleMapController controller){
    _mapController = controller;

    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('0'),
            position: LatLng(37.77483, -122.41942),
            infoWindow: InfoWindow(
              title: 'San Francisco',
              snippet: 'An Interesting city',
            ),
          icon: _markerIcon,
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dropoff location',
          style: Theme.of(context).textTheme.bodyText2.copyWith(
          color: BLACK,
          fontSize: 16.0,
        ),),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
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
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.77483, -122.41942),
               zoom: 12,
          ),
            markers: _markers,
            polygons: _polygon,
            polylines: _polylines,
            circles: _circles,
            myLocationEnabled: true,
            ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: Text('Coding with Curry'),
          ),
        ],
      )
    );
  }
}
