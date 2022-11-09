import 'package:coffe_shop/models/articles.dart';
import 'package:coffe_shop/models/books.dart';
import 'package:coffe_shop/models/events.dart';
import 'package:coffe_shop/models/token.dart';
import 'package:coffe_shop/screens/drawer.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/screens/cards.dart';
import 'package:coffe_shop/screens/app_bar.dart';
//void main() =>   runApp(CardList());

class CardList extends StatelessWidget {
  final List<Articles> articles;
  final List<Events> events;
  final List<Books> books;
  final Token token;
  ErrorMessages msgs = ErrorMessages();

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
              msgs.getMessage('MSG0021'),
              Icons.book_outlined,
              msgs.getMessage('MSG0022'),
              articles,
              events,
              books,
              token,
              context),
          carsProductos(
              msgs.getMessage('MSG0023'),
              Icons.event_note_rounded,
              msgs.getMessage('MSG0024'),
              articles,
              events,
              books,
              token,
              context),
          carsProductos(
              msgs.getMessage('MSG0025'),
              Icons.article_outlined,
              msgs.getMessage('MSG0026'),
              articles,
              events,
              books,
              token,
              context),
        ])),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
