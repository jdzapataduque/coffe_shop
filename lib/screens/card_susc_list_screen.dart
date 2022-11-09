import 'package:coffe_shop/models/token.dart';
import 'package:coffe_shop/screens/cards_susc_screen.dart';
import 'package:coffe_shop/screens/drawer.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/screens/app_bar.dart';
//void main() =>   runApp(CardList());

class CardListSuscriptions extends StatelessWidget {
  final Token token;
  ErrorMessages msgs = ErrorMessages();

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
              msgs.getMessage('MSG0027'),
              Icons.subscriptions_rounded,
              msgs.getMessage('MSG0028'),
              token,
              context),
          cardsSuscriptions(msgs.getMessage('MSG0029'), Icons.check,
              msgs.getMessage('MSG0030'), token, context),
        ])),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
