import 'package:coffe_shop/models/coffeeshop.dart';
import 'package:coffe_shop/models/coords.dart';
import 'package:coffe_shop/screens/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../helpers/constants.dart';
import '../models/token.dart';
import 'dart:convert';

class StoreMap extends StatefulWidget {
  final Token token;

  StoreMap({required this.token});

  @override
  State<StoreMap> createState() => _StoreMap();
}

class _StoreMap extends State<StoreMap> {
  late GoogleMapController mapController;
  CoffeeShop _coffeeShop = new CoffeeShop(
      name: '',
      address1: '',
      address2: '',
      coords: null,
      placeid: '',
      category: '');
  final LatLng _center = const LatLng(6.227623664931631, -75.57505450783523);
  Coords coordenadas = new Coords(lat: 0, lng: 0);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    _getStores();
    return MaterialApp(
      home: Scaffold(
        appBar: customAppBar(),
        body: GoogleMap(
          markers: _stores(_coffeeShop),
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Set<Marker> _stores(CoffeeShop _coffeeShop) {
    final Set<Marker> markers = new Set();
    //for (var i = 0; i < _coffeeShop; i++) {
    //_suscriptionsAvailable2.add(SubscriptionsAvailable.fromJson(item));
    markers.add(Marker(
      markerId: MarkerId(_coffeeShop.placeid!),
      position: LatLng(_coffeeShop.coords!.lat,
          _coffeeShop.coords!.lng), //position of marker
      infoWindow: InfoWindow(
        title: _coffeeShop.name,
        snippet: _coffeeShop.address1! + ' ' + _coffeeShop.address2!,
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    //}

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

  _getStores() async {
    Map<String, dynamic> request = {
      "user": widget.token.email.toString(),
    };

    var url = Uri.parse('${Constants.apiUrlGetCoffeeShops}');
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': widget.token.token.toString(),
      },
    );

    if (response.statusCode >= 400) {
      setState(() {});
      return;
    }
    var body = response.body;
    var decodedJson = jsonDecode(body);
    _coffeeShop = CoffeeShop.fromJson(decodedJson);
  }
}
