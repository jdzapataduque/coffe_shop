import 'package:coffe_shop/models/token.dart';
import 'package:coffe_shop/screens/cards_susc_screen.dart';
import 'package:coffe_shop/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/screens/app_bar.dart';
//void main() =>   runApp(CardList());

class CardListSuscriptions extends StatelessWidget {
  final Token token;

  CardListSuscriptions({required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: customAppBar(),
        drawer: DrawerPage(token: token),
        body: Center(
            child: Column(children: <Widget>[
          cardsSuscriptions(
              "Suscripciones actuales",
              Icons.subscriptions_rounded,
              "Encuentra tus suscripciones actuales",
              token,
              context),
          cardsSuscriptions(
              "Suscripciones disponibles",
              Icons.check,
              "Mira las suscripciones disponibles que tenemos para ti , seguro te gustarán",
              token,
              context),
        ])),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
