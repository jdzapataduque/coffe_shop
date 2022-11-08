import 'package:coffe_shop/screens/articles_screen.dart';
import 'package:coffe_shop/screens/books_screen.dart';
import 'package:coffe_shop/screens/events_screen.dart';
import 'package:flutter/material.dart';

Card carsProductos(String titulo, IconData icono, String descripcion,
    var _articles, var _events, var _books, BuildContext context) {
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
              onPressed: () =>
                  _showLover(titulo, _articles, _events, _books, context),
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

void _showLover(
    String titulo, articles, events, books, BuildContext context) async {
  switch (titulo) {
    case 'Artículos':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlesScreen(articles: articles)));
      break;
    case 'Eventos':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EventsScreen(events: events)));
      break;
    case 'Libros':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BooksScreen(
                    books: books,
                  )));
      break;
    default:
  }
}
