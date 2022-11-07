import 'package:flutter/material.dart';
import 'package:coffe_shop/screens/cards.dart';
import 'package:coffe_shop/screens/app_bar.dart';
//void main() =>   runApp(CardList());

class CardList extends StatelessWidget {
  const CardList({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: customAppBar(),
        body:  Center(  child: Column(
            children: <Widget>[
              carsProductos("Libros",Icons.book,"Encuentra libros a buenos precios."),
              carsProductos("Accesorios",Icons.coffee_maker_outlined,"¿Eres un amante al café?   acá encontraras todo lo necesario."),
              carsProductos("Souvenirs",Icons.card_giftcard_sharp,"Encuentra pines, mugs, velas  y muchos regalitos más."),
            ])),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}