import 'dart:convert';
import 'package:coffe_shop/models/suscriptions.dart';
import 'package:coffe_shop/screens/app_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import '../models/token.dart';
import 'package:http/http.dart' as http;
import 'package:coffe_shop/helpers/globals.dart' as globals;



class SuscriptionsScreen extends StatefulWidget {
  final Token token;

  SuscriptionsScreen({required this.token});

  @override
  State<SuscriptionsScreen> createState() => _SuscriptionsScreenState();
}

class _SuscriptionsScreenState extends State<SuscriptionsScreen> {
  List<Suscriptions> _currentsuscriptions = [];
  List<Suscriptions> _suscriptionsAvailable = [];
  List<dynamic> listajuan = [];
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _getSuscriptions();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Center(
        child: _getContent(),
      ),
    );
  }

  void _getSuscriptions() async {
    Map<String, dynamic> request = {'user': widget.token.email};
    var url = Uri.parse('${Constants.apiUrlSuscriptions}');
    var response = await http.post(
      url,
      headers: {'Authorization': widget.token.token.toString()},
      body: jsonEncode(request),
    );

    //Obtener respuesta del body , debido a que el status code,
    //está devolviendo exitoso si el logueo es fallido
    Map<String, dynamic> map = json.decode(response.body);
    var body = response.body;
    var jsonjuan = jsonDecode(body);
    var currentSusc = jsonDecode(response.body)["current_subscriptions"];
    var suscriptionAvail = jsonDecode(response.body)["subscriptions_available"];

    //listajuan = jsonjuan;

    if (((currentSusc == null) || (currentSusc.toString().isEmpty)) &&
        ((suscriptionAvail == null) || (suscriptionAvail.toString().isEmpty))) {
      return;
    }

    /*
    for (var item in jsonjuan) {
      _currentsuscriptions.add(Suscriptions.fromJson(item));
    }
*/


    if(globals.token!=null) {
      _firebaseMessaging.getToken().then((token){
        globals.tokenMobile=token;
        print (token);
      });

      Map<String, dynamic> request = {'token': globals.tokenMobile,'user': globals.token?.email.toString(),'arn':'${Constants.Arn}'};
      var url = Uri.parse('${Constants.EndPointRegisterMobile}');
      var response = await http.post(
        url,
        body: jsonEncode(request),
      );

      //Obtener respuesta del body , debido a que el status code,
      //está devolviendo exitoso si el logueo es fallido
      var responseser = jsonDecode(response.body)["Respose"];


    }

    // for (var item in suscriptionAvail) {
    //   _suscriptionsAvailable.add(Suscriptions.fromJson(item));
    // }

    setState(() {});
  }

  Widget _getContent() {
    return _getListView();
  }

  Widget _getListView() {
    return ListView(
      children: listajuan.map((listajdz) {
        return Container(
            child: Text('JUANn'),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(15));
      }).toList(),
    );
  }

  Widget _noContent() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Text(
          'No hay suscripciones disponibles',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
