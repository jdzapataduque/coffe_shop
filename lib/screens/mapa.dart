import 'package:coffe_shop/models/coffeeshop.dart';
import 'package:coffe_shop/models/coords.dart';
import 'package:coffe_shop/screens/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../helpers/constants.dart';
import '../models/shop.dart';
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
  late List<Shop> _shop = [];
  final LatLng _center = const LatLng(6.227623664931631, -75.57505450783523);
  Coords coordenadas = new Coords(lat: 0, lng: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: customAppBar(),
        body: GoogleMap(
          markers: _stores(_shop),
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

  Set<Marker> _stores(List<Shop> _coffeeShop) {
    final Set<Marker> markers = new Set();
    _getStores();
    for (var i = 0; i < _coffeeShop.length; i++) {
      markers.add(Marker(
        markerId: MarkerId(_coffeeShop[i].placeid!),
        position: LatLng(_coffeeShop[i].coords!.lat,
            _coffeeShop[i].coords!.lng), //position of marker
        infoWindow: InfoWindow(
          title: _coffeeShop[i].name,
          snippet: '${_coffeeShop[i].address1!} ${_coffeeShop[i].address2!}',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    }
    return markers;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
    var decodedJson = jsonDecode('{"shop":$body}');
    var decoded = utf8.decode(decodedJson) as dynamic;
    var shop = CoffeeShop.fromJson(decoded).shop!;
    for (var item in shop) {
      _shop.add(item);
    }
    setState(() {});
  }
}
