import 'dart:convert';
import 'package:coffe_shop/components/loader_component.dart';
import 'package:coffe_shop/screens/app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:coffe_shop/helpers/constants.dart';
import 'package:coffe_shop/models/suscriptions.dart';
import 'package:coffe_shop/models/token.dart';
import 'package:flutter/material.dart';

class CurrentSuscriptionsScreen extends StatefulWidget {
  final Token token;

  CurrentSuscriptionsScreen({required this.token});

  @override
  State<CurrentSuscriptionsScreen> createState() =>
      _CurrentSuscriptionsScreenState();
}

class _CurrentSuscriptionsScreenState extends State<CurrentSuscriptionsScreen> {
  final List<CurrentSubscriptions> _currentsuscriptions = [];
  bool _showloader = false;

  @override
  void initState() {
    super.initState();
    _getSuscriptions();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Center(
        child: _showloader
            ? LoaderComponent(
                text: 'Por favor espere...',
              )
            : _getContent(),
      ),
    );
  }

  void _getSuscriptions() async {
    setState(() {
      _showloader = true;
    });
    Map<String, dynamic> request = {'user': widget.token.email};
    var url = Uri.parse('${Constants.apiUrlSuscriptions}');
    var response = await http.post(
      url,
      headers: {'Authorization': widget.token.token.toString()},
      body: jsonEncode(request),
    );

    if (response.statusCode >= 400) {
      setState(() {
        _showloader = false;
      });
      await showAlertDialog(
          context: context,
          title: 'Error cargando suscripciones actuales',
          message:
              'Hubo un error buscando tus suscripciones actuales, te ofrecemos disculpas',
          actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar'),
          ]);
      return;
    }

    //Obtener respuesta del body , debido a que el status code,
    //está devolviendo exitoso si el logueo es fallido
    Map<String, dynamic> map = json.decode(response.body);
    var currentSusc =
        json.decode(utf8.decode(response.bodyBytes))["current_subscriptions"];
    if ((currentSusc != null) && !(currentSusc.isEmpty)) {
      for (var item in currentSusc) {
        _currentsuscriptions.add(CurrentSubscriptions.fromJson(item));
      }
    }
    setState(() {
      _showloader = false;
    });
  }

  Widget _getContent() {
    return _currentsuscriptions.length == 0 ? _noContent() : _getListView();
  }

  Widget _noContent() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Text(
          'No tienes suscripciones actuales',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _getListView() {
    return ListView(
      children: _currentsuscriptions.map((e) {
        return Card(
          child: InkWell(
            onTap: () => null,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FadeInImage(
                        placeholder: AssetImage('assets/img/logo.PNG'),
                        image: NetworkImage(e.image.toString()),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        e.title.toString(),
                        style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        e.subscriptionCountry.toString() +
                            ', ' +
                            e.subscriptionProvince.toString() +
                            ', ' +
                            e.subscriptionCity.toString() +
                            ', ' +
                            e.subscriptionAddress1.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
