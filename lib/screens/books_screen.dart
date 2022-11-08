import 'package:coffe_shop/models/books.dart';
import 'package:coffe_shop/screens/app_bar.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'package:flutter/material.dart';

class BooksScreen extends StatefulWidget {
  final List<Books> books;

  BooksScreen({required this.books});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  ErrorMessages errorHandling = ErrorMessages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(),
      body: Center(
        child: _showBooks(),
      ),
    );
  }

  Widget _showBooks() {
    return ListView(
      children: widget.books.map((e) {
        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     FadeInImage(
                  //       placeholder: AssetImage('assets/img/logo.PNG'),
                  //       image: NetworkImage(e.images()),
                  //       height: 100,
                  //       width: 100,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: [
                      Text(
                        e.title.toString(),
                        style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
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
