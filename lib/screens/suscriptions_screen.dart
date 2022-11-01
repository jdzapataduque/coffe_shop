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
    Map<String, dynamic> arraySuscriptions = jsonDecode(response.body);
    var currentSusc = arraySuscriptions["current_subscriptions"];
    var suscriptionAvail = arraySuscriptions["subscriptions_available"];

    if (((currentSusc == null) || (currentSusc.toString().isEmpty)) &&
        ((suscriptionAvail == null) || (suscriptionAvail.toString().isEmpty))) {
      return;
    }

    for (var item in currentSusc) {
      _currentsuscriptions.add(Suscriptions.fromJson(item));
    }

    for (var item in suscriptionAvail) {
      _suscriptionsAvailable.add(Suscriptions.fromJson(item));
    }

    print(_currentsuscriptions);
    print(_suscriptionsAvailable);
  }

  Widget _getContent() {
    return Container();
  }
}
