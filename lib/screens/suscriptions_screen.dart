import 'dart:convert';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:coffe_shop/components/loader_component.dart';
import 'package:coffe_shop/models/suscriptions.dart';
import 'package:coffe_shop/screens/app_bar.dart';
import 'package:coffe_shop/utils/check_internet.dart';
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
  final List<SubscriptionsAvailable> _suscriptionsAvailable = [];
  CheckInternet chkinternet = CheckInternet();

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
    if (await _check_intenet()) {
      return;
    }
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
          title: 'Error cargando suscripciones disponibles',
          message:
              'Hubo un error buscando tus suscripciones disponibles, te ofrecemos disculpas',
          actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar'),
          ]);
      return;
    }

    //Obtener respuesta del body , debido a que el status code,
    //está devolviendo exitoso si el logueo es fallido
    Map<String, dynamic> map = json.decode(response.body);
    var suscriptionAvail =
        json.decode(utf8.decode(response.bodyBytes))["subscriptions_available"];

    if ((suscriptionAvail != null) && !(suscriptionAvail.isEmpty)) {
      for (var item in suscriptionAvail) {
        _suscriptionsAvailable.add(SubscriptionsAvailable.fromJson(item));
      }
    }
    setState(() {
      _showloader = false;
    });
  }

  Widget _getContent() {
    return _suscriptionsAvailable.length == 0 ? _noContent() : _getListView();
    // return _currentsuscriptions2.length == 0
    //     ? _noContentCurrent()
    //     : _getListViewC();
  }

  Widget _getListView() {
    return ListView(
      children: _suscriptionsAvailable.map((e) {
        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        e.productTitle.toString(),
                        style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        e.variantTitle.toString(),
                        style: TextStyle(
                            fontSize: 14,
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

  Future<bool> _check_intenet() async {
    if (await chkinternet.valInternet(context)) {
      setState(() {
        _showloader = false;
      });
      chkinternet.ShowMsg(
          context, 'Error', 'Por favor verifica tu conexión a internet');
      return true;
    } else {
      return false;
    }
  }
}
