import 'dart:convert';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:coffe_shop/components/loader_component.dart';
import 'package:coffe_shop/main.dart';
import 'package:coffe_shop/models/suscriptions.dart';
import 'package:coffe_shop/screens/app_bar.dart';
import 'package:coffe_shop/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final List<CurrentSubscriptions> _currentsuscriptions2 = [];
  final List<SubscriptionsAvailable> _suscriptionsAvailable2 = [];
  bool _showloader = false;

  Future _LoginKeep() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var emailKeep = preferences.getString('email');
    emailKeep == null
        ? Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => MyApp()))
        : emailKeep = null;
  }

  @override
  void initState() {
    super.initState();
    _LoginKeep();
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
          title: 'Error cargando suscripciones',
          message:
              'Hubo un error buscando tus suscripciones , te ofrecemos disculpas',
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
    var suscriptionAvail =
        json.decode(utf8.decode(response.bodyBytes))["subscriptions_available"];

    if ((suscriptionAvail != null) && !(suscriptionAvail.isEmpty)) {
      for (var item in suscriptionAvail) {
        _suscriptionsAvailable2.add(SubscriptionsAvailable.fromJson(item));
      }
    }

    if ((currentSusc != null) && !(currentSusc.isEmpty)) {
      for (var item in currentSusc) {
        _currentsuscriptions2.add(CurrentSubscriptions.fromJson(item));
      }
    }
    setState(() {
      _showloader = false;
    });
  }

  Widget _getContent() {
    return _suscriptionsAvailable2.length == 0 ? _noContent() : _getListViewA();
    // return _currentsuscriptions2.length == 0
    //     ? _noContentCurrent()
    //     : _getListViewC();
  }

  Widget _getListViewA() {
    return ListView(
      children: _suscriptionsAvailable2.map((e) {
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

  Widget _getListViewC() {
    return ListView(
      children: _currentsuscriptions2.map((e) {
        return InkWell(
          child: Container(
            child: Text(e.title.toString()),
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

  Widget _noContentCurrent() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Text(
          'No hay suscripciones actuales disponibles',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // void _LoginKeep() async {
  //   if (globals.token == null) {
  //     return;
  //   }
  //   var token2;
  //   globals.token != null ? token2 = globals.token : token2 = null;
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var emailKeep = preferences.getString('email');
  //   emailKeep == null
  //       ? Navigator.pushReplacement(
  //           context, new MaterialPageRoute(builder: (context) => LoginScreen()))
  //       : emailKeep = null;
  // }
}
