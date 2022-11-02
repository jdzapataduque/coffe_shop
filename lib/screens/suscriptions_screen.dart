import 'dart:convert';
import 'package:coffe_shop/models/suscriptions.dart';
import 'package:coffe_shop/screens/app_bar.dart';
import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import '../models/token.dart';
import 'package:http/http.dart' as http;

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

    for (var item in jsonjuan) {
      _currentsuscriptions.add(Suscriptions.fromJson(item));
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
