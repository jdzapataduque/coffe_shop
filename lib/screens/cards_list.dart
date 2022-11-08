import 'package:coffe_shop/models/articles.dart';
import 'package:coffe_shop/models/books.dart';
import 'package:coffe_shop/models/events.dart';
import 'package:coffe_shop/models/token.dart';
import 'package:coffe_shop/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/screens/cards.dart';
import 'package:coffe_shop/screens/app_bar.dart';
//void main() =>   runApp(CardList());

class CardList extends StatelessWidget {
  final List<Articles> articles;
  final List<Events> events;
  final List<Books> books;
  final Token token;

  CardList(
      {required this.articles,
      required this.events,
      required this.books,
      required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: customAppBar(),
        drawer: DrawerPage(token: token),
        body: Center(
            child: Column(children: <Widget>[
          carsProductos(
              "Libros",
              Icons.book_outlined,
              "Encuentra libros a buenos precios.",
              articles,
              events,
              books,
              context),
          carsProductos(
              "Eventos",
              Icons.event_note_rounded,
              "¿Eres un amante al café?   acá encontraras todo lo necesario.",
              articles,
              events,
              books,
              context),
          carsProductos(
              "Articulos",
              Icons.article_outlined,
              "Encuentra pines, mugs, velas  y muchos regalitos más.",
              articles,
              events,
              books,
              context),
        ])),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
