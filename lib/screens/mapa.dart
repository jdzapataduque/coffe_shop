import 'package:coffe_shop/screens/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(6.227623664931631, -75.57505450783523);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: customAppBar(),
        body: GoogleMap(
          markers: _stores(),
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }

  Set<Marker> _stores() {
    final Set<Marker> markers = new Set();
    markers.add(Marker(
      markerId: MarkerId('tienda1'),
      position:
          LatLng(6.229052843017938, -75.57080588886014), //position of marker
      infoWindow: InfoWindow(
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    markers.add(Marker(
      markerId: MarkerId('tienda2'),
      position:
          LatLng(6.230140722258932, -75.5739708953855), //position of marker
      infoWindow: InfoWindow(
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    return markers;
  }
}
