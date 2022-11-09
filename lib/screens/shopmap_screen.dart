import 'dart:typed_data';
import 'dart:async';
import 'dart:ui' as ui;
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
import 'package:flutter/services.dart';
class ShopMap extends StatefulWidget {
  final Token token;

  ShopMap({required this.token});

  @override
  State<ShopMap> createState() => _ShopMap();
}

class _ShopMap extends State<ShopMap> {
  late Uint8List icono;
  late GoogleMapController mapController;
  final List<Shop> _shop = [];
  final LatLng _center = const LatLng(6.2070827309935455, -75.56605876441803);
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
          body: Center(
            child: GoogleMap(
              markers: _stores(_shop),
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }



  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  Future<Uint8List> getImages(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();

  }

  _getStores() async {
    Map<String, dynamic> request = {
      "user": widget.token.email.toString(),
    };
    final Uint8List markIcons = await getImages("assets/img/shop.png", 100);
    icono=markIcons;
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
    var body2 = '{"shop":$body}';
    var decoded = utf8.decode(body2.toString().runes.toList());
    var decodedJson = jsonDecode(decoded);
    var shop = CoffeeShop.fromJson(decodedJson).shop!;
    for (var item in shop) {
      _shop.add(item);
    }
    setState(() {});
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
        //icon: BitmapDescriptor.defaultMarker //Icon for Marker
        icon: BitmapDescriptor.fromBytes(icono),
      ));
    }
    return markers;
  }
}
