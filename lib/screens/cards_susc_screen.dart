import 'package:coffe_shop/screens/current_suscriptions_screen.dart';
import 'package:coffe_shop/screens/suscriptions_screen.dart';
import 'package:flutter/material.dart';

Card cardsSuscriptions(String titulo, IconData icono, String descripcion,
    var _token, BuildContext context) {
  return Card(
    // Con esta propiedad modificamos la forma de nuestro card
    // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 12,
    child: Column(
      children: <Widget>[
        // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 15, 25, 0),
          title: Text(titulo),
          subtitle: Text(descripcion),
          leading: Icon(icono, color: Colors.pinkAccent, size: 40),
        ),

        SizedBox(
          width: 132,
          child: Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () => _showLover(titulo, _token, context),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pinkAccent)),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: const [
                    Icon(Icons.touch_app),
                    Text('Ver más',
                        style: TextStyle(fontFamily: 'PoppinsBold')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

void _showLover(String titulo, token, BuildContext context) async {
  switch (titulo) {
    case 'Suscripciones actuales':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CurrentSuscriptionsScreen(
                    token: token,
                  )));
      break;
    case 'Suscripciones disponibles':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SuscriptionsScreen(
                    token: token,
                  )));
      break;
    default:
  }
}
