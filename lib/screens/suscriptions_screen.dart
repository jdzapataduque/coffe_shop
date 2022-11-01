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
  List<Suscriptions> _suscriptions = [];

  @override
  void initState() {
    super.initState();
    _getSuscriptions();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Center(
        child: Text('Suscripciones'),
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
    Map<String, dynamic> currentSuscriptions = jsonDecode(response.body);
    var currentSusc = currentSuscriptions["subscriptions_available"];

    if ((currentSusc == null) || (currentSusc.toString().isEmpty)) {
      return;
    }

    for (var item in currentSusc) {
      _suscriptions.add(Suscriptions.fromJson(item));
    }

    print(_suscriptions);
  }
}
